<div align="center">

# ⚡ OH·MY·WSL

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
| **Layer 3** | [Zoxide](https://github.com/ajeetdsouza/zoxide) + [Atuin](https://atuin.sh/) + [LSD](https://github.com/lsd-rs/lsd) | 高效命令 | 肌肉记忆的终结者，不再翻找历史，不再输入长路径 |
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
<summary>Layer 3 · 高效命令（Zoxide + Atuin + LSD）</summary>

```bash
# Zoxide — 智能 cd
curl -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Atuin — 增强历史记录
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# LSD — 现代 ls（Ubuntu 23.04+）
sudo apt install lsd
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

# Claude Code（官方原生安装脚本，自动更新，无需 Node 依赖）
curl -fsSL https://claude.ai/install.sh | bash
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
