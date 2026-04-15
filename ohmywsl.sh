#!/bin/bash
#
# OH-MY-WSL 一键安装脚本
# 按照 README.md 四层架构安装：
#   第一层：空间管理 - Zellij + Yazi
#   第二层：交互逻辑 - Fish + Starship
#   第三层：高效命令 - Zoxide + Atuin + LSD
#   第四层：生产力核心 - Neovim(LazyVim) + Claude Code
#
# 幂等设计：支持多次重复运行，已安装组件自动跳过，配置不重复注入
#

set -euo pipefail

# ==================== 颜色定义 ====================
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# ==================== 辅助函数 ====================

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

log_step() {
    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}[STEP]${NC} $1"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

log_skip() {
    echo -e "${YELLOW}[SKIP]${NC} $1 已安装，跳过"
}

# 检测命令是否存在
is_installed() {
    command -v "$1" &>/dev/null
}

# 检测文件/目录是否存在
path_exists() {
    [[ -e "$1" ]]
}

# 获取系统架构，统一为 x86_64 或 aarch64
get_arch() {
    local arch
    arch="$(uname -m)"
    echo "$arch"
}

# ==================== 第0层：基础依赖 ====================

install_base_deps() {
    log_step "第0层：安装基础依赖"
    sudo apt-get update -qq
    # file 是 Yazi 必须的 mime 类型检测工具
    sudo apt-get install -y \
        curl git build-essential unzip wget \
        file xclip \
        ffmpeg p7zip-full jq poppler-utils fd-find ripgrep fzf imagemagick
    log_info "基础依赖安装完成"
}

# ==================== 第一层：空间管理 (Zellij + Yazi) ====================

install_zellij() {
    if is_installed zellij; then
        log_skip "Zellij"
        return 0
    fi

    log_info "安装 Zellij（终端多路复用器）..."
    # 官方推荐：从 GitHub Releases 下载预构建二进制
    # 参考：https://zellij.dev/documentation/installation
    local arch
    arch="$(get_arch)"
    local tmp_dir
    tmp_dir="$(mktemp -d)"

    curl -sSL \
        "https://github.com/zellij-org/zellij/releases/latest/download/zellij-${arch}-unknown-linux-musl.tar.gz" \
        | tar -xz -C "$tmp_dir"

    sudo install -m 755 "$tmp_dir/zellij" /usr/local/bin/zellij
    rm -rf "$tmp_dir"
    log_info "Zellij 安装完成：$(zellij --version)"
}

install_yazi() {
    if is_installed yazi; then
        log_skip "Yazi"
        return 0
    fi

    log_info "安装 Yazi（终端文件管理器）..."
    # 官方推荐（Debian/Ubuntu）：从 GitHub Releases 下载官方预构建二进制
    # 参考：https://yazi-rs.github.io/docs/installation/#binaries
    local arch
    arch="$(get_arch)"
    local tmp_dir
    tmp_dir="$(mktemp -d)"

    # Yazi 发布包含 yazi（主程序）和 ya（CLI 工具）
    curl -sSL \
        "https://github.com/sxyazi/yazi/releases/latest/download/yazi-${arch}-unknown-linux-musl.zip" \
        -o "$tmp_dir/yazi.zip"

    unzip -q "$tmp_dir/yazi.zip" -d "$tmp_dir"
    # 解压目录名格式：yazi-<arch>-unknown-linux-musl
    local extracted_dir
    extracted_dir="$(find "$tmp_dir" -maxdepth 1 -type d -name "yazi-*" | head -1)"

    sudo install -m 755 "$extracted_dir/yazi" /usr/local/bin/yazi
    sudo install -m 755 "$extracted_dir/ya" /usr/local/bin/ya
    rm -rf "$tmp_dir"
    log_info "Yazi 安装完成：$(yazi --version)"
}

# ==================== 第二层：交互逻辑 (Fish + Starship) ====================

install_fish() {
    if is_installed fish; then
        log_skip "Fish Shell"
        return 0
    fi

    log_info "安装 Fish Shell..."
    # 官方推荐：apt 包管理器
    # 参考：https://fishshell.com/
    sudo apt-get install -y fish
    log_info "Fish Shell 安装完成：$(fish --version)"
}

install_starship() {
    if is_installed starship; then
        log_skip "Starship"
        return 0
    fi

    log_info "安装 Starship（跨 shell 提示符）..."
    # 官方推荐安装脚本：https://starship.rs/guide/#step-1-install-starship
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
    log_info "Starship 安装完成：$(starship --version | head -1)"
}

# ==================== 第三层：高效命令 (Zoxide + Atuin + LSD) ====================

install_zoxide() {
    if is_installed zoxide; then
        log_skip "Zoxide"
        return 0
    fi

    log_info "安装 Zoxide（智能 cd 命令）..."
    # 官方推荐安装脚本：https://github.com/ajeetdsouza/zoxide#installation
    # 注：Debian/Ubuntu 包版本较旧，官方推荐用安装脚本
    curl -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    log_info "Zoxide 安装完成：$(zoxide --version)"
}

install_atuin() {
    if is_installed atuin; then
        log_skip "Atuin"
        return 0
    fi

    log_info "安装 Atuin（增强版 Shell 历史记录）..."
    # 官方推荐安装脚本：https://github.com/atuinsh/atuin#installation
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    log_info "Atuin 安装完成：$(atuin --version)"
}

install_lsd() {
    if is_installed lsd; then
        log_skip "LSD"
        return 0
    fi

    log_info "安装 LSD（现代 ls 替代）..."
    # Debian bookworm/sid 及 Ubuntu 23.04+ 可直接 apt 安装
    # 旧版本则从 GitHub Releases 下载
    # 参考：https://github.com/lsd-rs/lsd#installation
    if apt-cache show lsd &>/dev/null 2>&1; then
        sudo apt-get install -y lsd
    else
        local arch
        arch="$(get_arch)"
        local tmp_dir
        tmp_dir="$(mktemp -d)"
        # 获取最新版本号
        local latest_ver
        latest_ver="$(curl -sSf https://api.github.com/repos/lsd-rs/lsd/releases/latest \
            | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')"

        curl -sSL \
            "https://github.com/lsd-rs/lsd/releases/latest/download/lsd-v${latest_ver}-${arch}-unknown-linux-musl.tar.gz" \
            | tar -xz -C "$tmp_dir"

        local extracted_dir
        extracted_dir="$(find "$tmp_dir" -maxdepth 1 -type d -name "lsd-*" | head -1)"
        sudo install -m 755 "$extracted_dir/lsd" /usr/local/bin/lsd
        rm -rf "$tmp_dir"
    fi
    log_info "LSD 安装完成：$(lsd --version)"
}

# ==================== 第四层：生产力核心 (Neovim + LazyVim + Node.js + Claude Code) ====================

install_neovim() {
    if is_installed nvim; then
        log_skip "Neovim"
        return 0
    fi

    log_info "安装 Neovim（最新稳定版）..."
    # 官方推荐：从 GitHub Releases 下载预构建包（apt 版本过旧）
    # 参考：https://github.com/neovim/neovim/blob/master/INSTALL.md#linux
    local arch
    arch="$(get_arch)"
    local tmp_dir
    tmp_dir="$(mktemp -d)"

    curl -sSL \
        "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${arch}.tar.gz" \
        -o "$tmp_dir/nvim.tar.gz"

    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf "$tmp_dir/nvim.tar.gz"
    sudo ln -sf "/opt/nvim-linux-${arch}/bin/nvim" /usr/local/bin/nvim
    rm -rf "$tmp_dir"
    log_info "Neovim 安装完成：$(nvim --version | head -1)"
}

install_lazyvim() {
    local nvim_conf="$HOME/.config/nvim"

    if path_exists "$nvim_conf"; then
        log_skip "LazyVim 配置"
        return 0
    fi

    log_info "部署 LazyVim starter 配置..."
    # 官方推荐：克隆 LazyVim starter 模板
    # 参考：https://www.lazyvim.org/installation
    git clone --depth 1 https://github.com/LazyVim/starter "$nvim_conf"
    # 移除 .git 以便用户纳入自己的版本控制
    rm -rf "$nvim_conf/.git"
    log_info "LazyVim 配置部署完成"
}

install_nodejs() {
    # 检查 nvm 是否已安装
    local nvm_dir="${NVM_DIR:-$HOME/.nvm}"
    if [[ -s "$nvm_dir/nvm.sh" ]]; then
        log_skip "nvm（Node.js 版本管理器）"
        return 0
    fi

    log_info "安装 nvm（Node.js 版本管理器）..."
    # 官方推荐安装脚本：https://github.com/nvm-sh/nvm#installing-and-updating
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

    # 立即加载 nvm，使后续步骤可用
    export NVM_DIR="$HOME/.nvm"
    # shellcheck source=/dev/null
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    log_info "nvm 安装完成"

    log_info "安装 Node.js LTS..."
    nvm install --lts
    nvm use --lts
    log_info "Node.js 安装完成：$(node --version)，npm：$(npm --version)"
}

install_claude_code() {
    if is_installed claude; then
        log_skip "Claude Code"
        return 0
    fi

    log_info "安装 Claude Code..."
    # 确保 nvm 和 node 已加载
    local nvm_dir="${NVM_DIR:-$HOME/.nvm}"
    if [[ -s "$nvm_dir/nvm.sh" ]]; then
        # shellcheck source=/dev/null
        source "$nvm_dir/nvm.sh"
    fi

    if ! is_installed npm; then
        log_error "npm 未找到，请先确认 Node.js 已正确安装"
        return 1
    fi

    # 官方推荐：通过 npm 全局安装
    # 参考：https://docs.anthropic.com/en/docs/claude-code
    npm install -g @anthropic-ai/claude-code
    log_info "Claude Code 安装完成：$(claude --version 2>/dev/null || echo '请重启 Shell 后验证')"
}

# ==================== Fish Shell 配置注入 ====================

configure_fish() {
    log_step "配置阶段：Fish Shell"
    local fish_conf="$HOME/.config/fish/config.fish"
    # 使用唯一标记，防止重复注入
    local marker="# <<< OH-MY-WSL BEGIN >>>"

    mkdir -p "$(dirname "$fish_conf")"
    touch "$fish_conf"

    if grep -qF "$marker" "$fish_conf"; then
        log_skip "Fish 配置块"
        return 0
    fi

    log_info "注入 Fish 配置..."
    cat >> "$fish_conf" << 'FISH_BLOCK'

# <<< OH-MY-WSL BEGIN >>>
# 由 ohmywsl.sh 自动生成，请勿手动修改此块
if status is-interactive

    # ── 第二层：交互逻辑 ──
    # Starship 提示符
    if type -q starship
        starship init fish | source
    end

    # ── 第三层：高效命令 ──
    # Zoxide：智能目录跳转（替代 cd）
    if type -q zoxide
        zoxide init fish | source
    end

    # Atuin：增强版历史记录（Ctrl-R 全屏搜索）
    if type -q atuin
        atuin init fish | source
    end

    # ── 别名 ──
    # ls 替换为 lsd（图标 + 颜色）
    if type -q lsd
        alias ls='lsd'
        alias l='lsd -l'
        alias la='lsd -a'
        alias ll='lsd -la'
        alias lt='lsd --tree'
    end

    # ── 第一层：空间管理 ──
    alias zj='zellij'
    alias y='yazi'

    # ── 第四层：生产力核心 ──
    alias vi='nvim'
    alias vim='nvim'
    alias cc='claude'

    # ── nvm（Node.js 版本管理）──
    set -gx NVM_DIR "$HOME/.nvm"
    if test -s "$NVM_DIR/nvm.sh"
        # bass 用于在 fish 中加载 bash 脚本（需安装 bass）
        # 若未安装 bass，可改用 fish-nvm 插件
        function nvm
            bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
        end
        # 自动使用默认 node 版本
        bass source "$NVM_DIR/nvm.sh"
    end

end
# <<< OH-MY-WSL END >>>
FISH_BLOCK

    log_info "Fish 配置注入完成"
}

# ==================== Starship 配置 ====================

configure_starship() {
    local starship_conf="$HOME/.config/starship.toml"

    if path_exists "$starship_conf"; then
        log_skip "Starship 配置文件"
        return 0
    fi

    log_info "创建 Starship 配置..."
    mkdir -p "$(dirname "$starship_conf")"

    cat > "$starship_conf" << 'STARSHIP_BLOCK'
# OH-MY-WSL Starship 配置
# 适配 Tokyo Night 主题，针对 WSL2 优化
# 参考：https://starship.rs/config/

format = """
$username\
$directory\
$git_branch\
$git_status\
$nodejs\
$python\
$rust\
$cmd_duration\
$line_break\
$character"""

[character]
success_symbol = "[❯](bold green)"
error_symbol = "[❯](bold red)"

[directory]
style = "bold #7aa2f7"
truncation_length = 3
truncate_to_repo = true
read_only = " 󰌾"

[git_branch]
style = "bold #bb9af7"
symbol = " "
truncation_length = 20

[git_status]
style = "bold #e0af68"
conflicted = "⚡"
ahead = "⇡${count}"
behind = "⇣${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
untracked = "?"
modified = "!"
staged = "+"
renamed = "»"
deleted = "✘"

[nodejs]
symbol = " "
style = "bold #9ece6a"

[python]
symbol = " "
style = "bold #e0af68"
pyenv_version_name = true

[rust]
symbol = " "
style = "bold #f7768e"

[cmd_duration]
min_time = 500
format = "took [$duration]($style) "
style = "bold #e0af68"

[username]
style_user = "bold #7dcfff"
style_root = "bold #f7768e"
format = "[$user]($style) "
show_always = false
STARSHIP_BLOCK

    log_info "Starship 配置完成"
}

# ==================== Zellij 配置 ====================

configure_zellij() {
    local zellij_conf="$HOME/.config/zellij/config.kdl"

    if path_exists "$zellij_conf"; then
        log_skip "Zellij 配置文件"
        return 0
    fi

    log_info "创建 Zellij 配置..."
    mkdir -p "$(dirname "$zellij_conf")"

    cat > "$zellij_conf" << 'ZELLIJ_BLOCK'
// OH-MY-WSL Zellij 配置
// 参考：https://zellij.dev/documentation/configuration

// 默认 shell 使用 fish
default_shell "fish"

// 主题（Tokyo Night）
theme "tokyo-night"

// 关闭鼠标模式以兼容不同终端
mouse_mode true

// 快捷键绑定
keybinds {
    normal {
        // Alt+方向键：在面板间跳转（与 README 一致）
        bind "Alt Left"  { MoveFocus "Left"; }
        bind "Alt Right" { MoveFocus "Right"; }
        bind "Alt Up"    { MoveFocus "Up"; }
        bind "Alt Down"  { MoveFocus "Down"; }
    }
}

// Tokyo Night 主题定义
themes {
    tokyo-night {
        fg          "#c0caf5"
        bg          "#1a1b26"
        black       "#15161e"
        red         "#f7768e"
        green       "#9ece6a"
        yellow      "#e0af68"
        blue        "#7aa2f7"
        magenta     "#bb9af7"
        cyan        "#7dcfff"
        white       "#a9b1d6"
        orange      "#ff9e64"
    }
}
ZELLIJ_BLOCK

    log_info "Zellij 配置完成"
}

# ==================== 主流程 ====================

main() {
    echo -e "${CYAN}"
    echo "  ██████╗ ██╗  ██╗███╗   ███╗██╗   ██╗    ██╗    ██╗███████╗██╗     "
    echo "  ██╔═══██╗██║  ██║████╗ ████║╚██╗ ██╔╝    ██║    ██║██╔════╝██║     "
    echo "  ██║   ██║███████║██╔████╔██║ ╚████╔╝     ██║ █╗ ██║███████╗██║     "
    echo "  ██║   ██║██╔══██║██║╚██╔╝██║  ╚██╔╝      ██║███╗██║╚════██║██║     "
    echo "  ╚██████╔╝██║  ██║██║ ╚═╝ ██║   ██║       ╚███╔███╔╝███████║███████╗"
    echo "   ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝        ╚══╝╚══╝ ╚══════╝╚══════╝"
    echo -e "${NC}"
    log_info "OH-MY-WSL 一键安装脚本启动（幂等设计，可重复运行）"
    echo ""

    # ── 第0层：基础依赖 ──
    install_base_deps

    # ── 第一层：空间管理 ──
    log_step "【第一层】空间管理 - Zellij + Yazi"
    install_zellij
    install_yazi

    # ── 第二层：交互逻辑 ──
    log_step "【第二层】交互逻辑 - Fish + Starship"
    install_fish
    install_starship

    # ── 第三层：高效命令 ──
    log_step "【第三层】高效命令 - Zoxide + Atuin + LSD"
    install_zoxide
    install_atuin
    install_lsd

    # ── 第四层：生产力核心 ──
    log_step "【第四层】生产力核心 - Neovim(LazyVim) + Node.js + Claude Code"
    install_neovim
    install_lazyvim
    install_nodejs
    install_claude_code

    # ── 配置注入（幂等） ──
    log_step "配置阶段：注入各组件配置"
    configure_starship
    configure_zellij
    configure_fish  # fish 配置最后注入，依赖其他组件已安装

    # ── 完成提示 ──
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║           ✅  OH-MY-WSL 安装完成！                  ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}【下一步操作】${NC}"
    echo -e "  1. 在 Windows 侧安装 ${CYAN}JetBrainsMono Nerd Font${NC}"
    echo -e "     下载地址：https://www.nerdfonts.com/font-downloads"
    echo -e "  2. 在 Windows Terminal 设置中将字体改为 JetBrainsMono Nerd Font"
    echo -e "  3. 重启终端，然后输入 ${GREEN}fish${NC} 进入 Fish Shell"
    echo -e "  4. 永久设为默认 Shell：${GREEN}chsh -s \$(which fish)${NC}"
    echo ""
    echo -e "${YELLOW}【常用命令】${NC}"
    echo -e "  ${GREEN}zj${NC}         → 启动 Zellij 分屏终端"
    echo -e "  ${GREEN}y${NC}          → 打开 Yazi 文件管理器"
    echo -e "  ${GREEN}z <目录名>${NC} → Zoxide 智能跳转"
    echo -e "  ${GREEN}Ctrl-R${NC}      → Atuin 历史搜索"
    echo -e "  ${GREEN}vi${NC}         → 打开 Neovim (LazyVim)"
    echo -e "  ${GREEN}cc${NC}         → 启动 Claude Code"
    echo ""
    echo -e "${YELLOW}【注意】${NC}"
    echo -e "  • nvm/Node.js 的 PATH 配置需重启终端后生效"
    echo -e "  • 首次启动 Neovim 会自动安装 LazyVim 插件，请耐心等待"
}

# 执行主流程
main "$@"