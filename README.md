<div align="center">

```
   ██████╗ ██╗  ██╗    ███╗   ███╗██╗   ██╗    ██╗    ██╗███████╗██╗
  ██╔═══██╗██║  ██║    ████╗ ████║╚██╗ ██╔╝    ██║    ██║██╔════╝██║
  ██║   ██║███████║    ██╔████╔██║ ╚████╔╝     ██║ █╗ ██║███████╗██║
  ██║   ██║██╔══██║    ██║╚██╔╝██║  ╚██╔╝      ██║███╗██║╚════██║██║
  ╚██████╔╝██║  ██║    ██║ ╚═╝ ██║   ██║       ╚███╔███╔╝███████║███████╗
   ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝   ╚═╝        ╚══╝╚══╝ ╚══════╝╚══════╝
```

**专为 WSL2 打造的极速 Vibe Coding 终端环境**

[![License: MIT](https://img.shields.io/badge/License-MIT-7aa2f7?style=flat-square)](LICENSE)
[![Platform: WSL2](https://img.shields.io/badge/Platform-WSL2-bb9af7?style=flat-square&logo=windows)](https://docs.microsoft.com/en-us/windows/wsl/)
[![Shell: Fish](https://img.shields.io/badge/Shell-Fish-9ece6a?style=flat-square)](https://fishshell.com/)
[![Powered by Rust](https://img.shields.io/badge/Powered_by-Rust_🦀-f7768e?style=flat-square)](https://www.rust-lang.org/)
[![AI: Claude Code](https://img.shields.io/badge/AI-Claude_Code-e0af68?style=flat-square)](https://docs.anthropic.com/en/docs/claude-code)

> *Build your terminal like a high-performance Rust engine.*

</div>

---

## 🧠 核心哲学

全量采用 **Rust 重写的现代工具链**（2026 标配），深度集成 **Claude Code**。  
极致的启动速度、智能的补全建议、以及充满**心流**的 Vibe Coding 体验。

---

## 🏗️ 四层架构 · The Stack

```
┌─────────────────────────────────────────────────────────────────┐
│  Layer 4 · 生产力核心    LazyVim  ·  Claude Code  ·  Copilot     │
├─────────────────────────────────────────────────────────────────┤
│  Layer 3 · 高效命令      Zoxide   ·  Atuin        ·  LSD         │
├─────────────────────────────────────────────────────────────────┤
│  Layer 2 · 交互逻辑      Fish Shell               ·  Starship    │
├─────────────────────────────────────────────────────────────────┤
│  Layer 1 · 空间管理      Zellij                   ·  Yazi        │
├─────────────────────────────────────────────────────────────────┤
│  Host    · 底层宿主      Windows Terminal         ·  WSL2        │
└─────────────────────────────────────────────────────────────────┘
```

| 层级 | 工具 | 角色 | 感官体验 |
| :---: | :--- | :--- | :--- |
| **Host** | Windows Terminal + WSL2 | 容器与渲染 | GPU 加速渲染，极致丝滑的文字滚动 |
| **Layer 1** | [Zellij](https://zellij.dev/) + [Yazi](https://yazi-rs.github.io/) | 空间管理 | 像 IDE 一样的分屏，再也不用鼠标点来点去 |
| **Layer 2** | [Fish](https://fishshell.com/) + [Starship](https://starship.rs/) | 交互逻辑 | 预测性补全 + 极速状态感知 |
| **Layer 3** | 🦭 **导航** [Zoxide](https://github.com/ajeetdsouza/zoxide) · [Atuin](https://atuin.sh/) | 高效命令 | 智能目录跳转 + 全局历史命令搜索 |
| | 🗂️ **文件** [LSD](https://github.com/lsd-rs/lsd) · [bat](https://github.com/sharkdp/bat) · [fd](https://github.com/sharkdp/fd) | | 彩色文件列表 + 语法高亮查看 + 快速查找 |
| | 🔍 **搜索** [ripgrep](https://github.com/BurntSushi/ripgrep) · [fzf](https://github.com/junegunn/fzf) | | 多核并行代码搜索 + 模糊匹配选择器 |
| | 🛠️ **辅助** [lazygit](https://github.com/jesseduffield/lazygit) · [fastfetch](https://github.com/fastfetch-cli/fastfetch) · [tlrc](https://github.com/tldr-pages/tlrc) | | Git TUI + 系统信息 + tldr 速查手册 |
| **Layer 4** | [LazyVim](https://www.lazyvim.org/) + [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | 生产力核心 | Copilot 写代码，Claude Code 跑 Agent |

---

## 📦 一键安装 · Quick Start

```bash
bash <(curl -sSL https://raw.githubusercontent.com/tomturing/ohmywsl/main/ohmywsl.sh)
```

> [!NOTE]
> 脚本支持**幂等运行**——可以多次执行，已安装的组件自动跳过，配置不会重复注入。

> [!IMPORTANT]
> 安装完成后，请在 Windows 侧安装 **[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)** 并在 Windows Terminal 字体设置中启用，否则图标将显示为乱码方块。

### 安装完成后

```bash
# 1. 切换到 Fish Shell
fish

# 2. 永久设为默认 Shell（重启终端生效）
chsh -s $(which fish)

# 3. 启动 Zellij 分屏终端
zj
```

---

## 📋 安装方式与目录说明

脚本采用 **3 种安装方式**，文件分布到 **4 个目录**：

### 安装方式

| 方式 | 工具 | 特点 |
| :--- | :--- | :--- |
| **apt-get** | fish, bat, fd, ripgrep, fzf, lsd, fastfetch | 系统包管理，版本可能滞后 |
| **官方安装脚本** | starship, zoxide, atuin, nvm | 自动检测系统，安装到用户目录 |
| **GitHub Releases 二进制** | zellij, yazi, lsd, tlrc, fastfetch, lazygit, neovim | 最新版本，手动下载解压 |

### 安装目录

| 目录 | 权限 | 工具 |
| :--- | :--- | :--- |
| `/usr/local/bin` | root (sudo) | zellij, yazi, ya, lsd, bat(软链), fd(软链), tldr, fastfetch, flashfetch, lazygit, nvim(软链) |
| `/opt/nvim-linux-{arch}` | root (sudo) | neovim 主程序目录 |
| `~/.local/bin` | 用户 | zoxide |
| `~/.atuin/bin` | 用户 | atuin |
| `~/.nvm` | 用户 | nvm + node + npm |

### 映射关系

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        安装方式 → 安装目录 映射                          │
├─────────────┬────────────────┬───────────────────────────────────────────┤
│ apt-get     │ /usr/bin       │ fish, ripgrep (rg), fzf                  │
│             │ /usr/local/bin │ bat→batcat软链, fd→fdfind软链            │
├─────────────┼────────────────┼───────────────────────────────────────────┤
│ 官方脚本    │ ~/.local/bin   │ zoxide                                   │
│             │ ~/.atuin/bin   │ atuin                                    │
│             │ ~/.nvm         │ nvm, node, npm                           │
│             │ /usr/local/bin │ starship                                 │
├─────────────┼────────────────┼───────────────────────────────────────────┤
│ Releases    │ /usr/local/bin │ zellij, yazi, ya, lsd, tldr,             │
│             │                │ fastfetch, flashfetch, lazygit           │
│             │ /opt + 软链    │ neovim                                   │
└─────────────┴────────────────┴───────────────────────────────────────────┘
```

---

## ⌨️ 快捷键速查 · Cheatsheet

### 🪟 空间管理 · Zellij

| 按键 | 动作 |
| :--- | :--- |
| `Alt` + `← → ↑ ↓` | 在面板之间跳转 |
| `Ctrl` + `p` → `n` | 新建面板 |
| `Ctrl` + `p` → `d` | 向下分屏 |
| `Ctrl` + `p` → `r` | 向右分屏 |
| `Ctrl` + `p` → `x` | 关闭当前面板 |
| `Ctrl` + `p` → `f` | 全屏切换当前面板 |

### 🧭 智能导航

| 命令 | 说明 |
| :--- | :--- |
| `z <关键词>` | Zoxide 智能跳转（无需完整路径）|
| `zi` | Zoxide 交互式选择目录（需 fzf）|
| `Ctrl` + `r` | Atuin 全屏历史命令搜索 |
| `y` | 打开 Yazi 文件管理器 |

### 📝 编辑器 · LazyVim

| 按键 | 动作 |
| :--- | :--- |
| `Space` + `f` + `f` | 模糊搜索文件 |
| `Space` + `f` + `g` | 搜索 Git 文件 |
| `Space` + `f` + `t` | 弹出浮动终端 |
| `Tab` | 采纳 Copilot 代码建议 |

### 🤖 AI 工具

| 命令 | 说明 |
| :--- | :--- |
| `cc` | 启动 Claude Code（Agent 模式）|
| `cc --help` | 查看 Claude Code 帮助 |

### 🔍 文本搜索与查看

> `bat` 是 `cat` 的语法高亮升级版；`rg` 比 `grep` 快 10x 并自动忽略 `.gitignore`；`fd` 是直觉化的 `find`；`fzf` 是通用模糊选择器

| 命令 | 说明 |
| :--- | :--- |
| `bat <文件>` | 语法高亮查看文件，支持 Git 行变更标注 |
| `rg <关键词>` | 全项目代码搜索（自动忽略 `.gitignore`）|
| `rg -t py <关键词>` | 只搜索指定类型文件（`py`/`js`/`go` 等）|
| `fd <文件名>` | 快速文件查找，支持正则，语法比 find 直觉 |
| `fzf` | 交互式模糊选择器（任意命令 `\|` 管道接入）|
| `Ctrl` + `T` | Fish 中模糊搜索文件并插入当前行 |

### 🛠️ 开发辅助

> `lg` 用键盘完成所有 Git 操作；`tldr <命令>` 是 3 秒速查的精简版 man

| 命令 | 说明 |
| :--- | :--- |
| `lg` | 启动 lazygit（可视化暂存 / 提交 / 分支 / 合并）|
| `tldr <命令>` | 查看命令速查示例（如 `tldr git`、`tldr curl`）|
| `ff` | 显示系统信息（fastfetch）|

---

## 🎨 视觉调优 · Visuals

推荐配置组合，打造完美视觉体验：

```
主题 (Theme)     →  Tokyo Night  ·  Catppuccin Mocha
字体 (Font)      →  JetBrainsMono Nerd Font · Meslo Nerd Font
透明度 (Opacity)  →  85% 不透明度（Acrylic 磨砂玻璃效果）
光标             →  竖线光标（Cursor: Bar）
```

**Windows Terminal 推荐配色方案（Tokyo Night）：**

```json
{
    "name": "Tokyo Night",
    "background": "#1a1b26",
    "foreground": "#c0caf5",
    "black": "#15161e",
    "red": "#f7768e",
    "green": "#9ece6a",
    "yellow": "#e0af68",
    "blue": "#7aa2f7",
    "purple": "#bb9af7",
    "cyan": "#7dcfff",
    "white": "#a9b1d6"
}
```

---

## 🔧 手动安装参考

如需单独安装某个组件：

<details>
<summary>Layer 1 · 空间管理（Zellij + Yazi）</summary>

```bash
# Zellij — 终端多路复用器
curl -sSL https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz | tar -xz
sudo install -m 755 zellij /usr/local/bin/

# Yazi — 终端文件管理器
curl -sSL https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip -o yazi.zip
unzip yazi.zip && sudo install -m 755 yazi-*/yazi yazi-*/ya /usr/local/bin/
```

</details>

<details>
<summary>Layer 2 · 交互逻辑（Fish + Starship）</summary>

```bash
# Fish Shell
sudo apt install fish

# Starship — 跨 Shell 提示符
curl -sS https://starship.rs/install.sh | sh
```

</details>

<details>
<summary>Layer 3 · 高效命令（Zoxide · Atuin · LSD · bat · fd · ripgrep · fzf · lazygit · tlrc · fastfetch）</summary>

```bash
# ── 导航与历史 ──

# Zoxide — 智能目录跳转（z 命令，替代 cd）
curl -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Atuin — 增强历史记录（Ctrl+R 全屏搜索）
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# ── 文件列表与文本查看 ──

# LSD — 彩色 ls（图标 + 颜色）
sudo apt install lsd

# bat — 语法高亮 cat（Ubuntu 安装为 batcat，需创建软链接）
sudo apt install bat
sudo ln -sf /usr/bin/batcat /usr/local/bin/bat   # Ubuntu 适用

# fd — 快速 find（Ubuntu 安装为 fdfind，需创建软链接）
sudo apt install fd-find
sudo ln -sf /usr/bin/fdfind /usr/local/bin/fd    # Ubuntu 适用

# ── 搜索 ──

# ripgrep — 多核并行 grep（命令为 rg）
sudo apt install ripgrep

# fzf — 模糊匹配选择器
sudo apt install fzf

# ── 开发辅助 ──

# lazygit — Git 终端可视化（从 GitHub 下载最新版以避免 apt 版本过旧）
LAZYGIT_VER=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VER}_linux_x86_64.tar.gz"
tar -xzf /tmp/lazygit.tar.gz -C /tmp lazygit && sudo install /tmp/lazygit /usr/local/bin

# tlrc — Rust 版 tldr 速查手册（命令为 tldr，文件名含版本号需动态获取）
TLRC_VER=$(curl -s https://api.github.com/repos/tldr-pages/tlrc/releases/latest | grep '"tag_name"' | sed 's/.*"\([^"]*\)".*/\1/')
curl -sSL "https://github.com/tldr-pages/tlrc/releases/download/${TLRC_VER}/tlrc-${TLRC_VER}-x86_64-unknown-linux-musl.tar.gz" | tar -xz
sudo install -m 755 tldr /usr/local/bin/tldr

# fastfetch — 系统信息展示（Ubuntu 22.04+）
sudo apt install fastfetch
```

</details>

<details>
<summary>Layer 4 · 生产力核心（Neovim + LazyVim + Claude Code）</summary>

```bash
# Neovim 最新稳定版（官方预构建）
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

# LazyVim starter 配置
git clone --depth 1 https://github.com/LazyVim/starter ~/.config/nvim

# Node.js via nvm（可选，仅当其他工具需要 Node 时）
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
nvm install --lts

# Claude Code
  npm install -g @anthropic-ai/claude-code
```

</details>

---

## 🤝 贡献与维护

这个项目将持续更新，以跟进最新的 AI 开发工具和 Rust 生产力工具。

欢迎提交 [Issue](https://github.com/tomturing/ohmywsl/issues) 或 [Pull Request](https://github.com/tomturing/ohmywsl/pulls) 来完善这个「Vibe 空间」！

---

<div align="center">

**[MIT License](LICENSE)** · Made with ❤️ for the WSL2 community

</div>
