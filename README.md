# 🚀 OH-MY-WSL

一个专为 WSL2 打造的深度定制开发环境。全量采用 Rust 效率增强件套 (2026 标配)，并深度集成了 Claude Code 与 Copilot。

核心哲学： 极致的启动速度、智能的补全建议、以及充满“心流”的 Vibe Coding 体验。

> **Build your terminal like a high-performance Rust engine.**

---

### 🛠️ 技术栈全景 (The Stack)

| 层级 | 工具 | 角色 | 核心 Vibe (感官体验) |
| :--- | :--- | :--- | :--- |
| **底层宿主** | Windows Terminal + WSL2 | 容器与渲染 | GPU 加速渲染，极致丝滑的文字滚动。 |
| **空间管理** | Zellij + Yazi | 布局与多任务 | 像 IDE 一样的分屏，再也不用鼠标点来点去。 |
| **交互逻辑** | Fish + Starship | 命令与反馈 | 预测性补全 + 极速状态感知。 |
| **高效命令** | Zoxide + Atuin + LSD/Eza | 导航与记忆 | 肌肉记忆的终结者。不再翻找历史，不再输入长路径。 |
| **生产力核心** | LazyVim + Claude Code | 编辑与思考 | Copilot 写代码，Claude Code 跑 Agent。 |

---

### 📦 一键安装 (Quick Start)

```bash
curl -sSL https://raw.githubusercontent.com/tomturing/ohmywsl/main/setup.sh | bash
```
注意： 脚本执行完成后，请在 Windows 侧安装 JetBrainsMono Nerd Font 并在终端设置中启用，否则图标将显示异常。

### ⌨️ 常用快捷键 (Quick Cheatsheet)
1. 空间管理 (Zellij)
Ctrl + p -> n : 水平/垂直分屏

Alt + 方向键 : 在不同面板间跳转

Ctrl + q : 退出会话

2. 智能命令
z <目录名> : 瞬间跳转（无需输入全路径）

↑ (方向键上) : 开启 Atuin 模糊搜索历史命令

y : 开启 Yazi 文件管理器

3. 编辑器 (LazyVim)
<Space> + f + f : 模糊搜索文件

Tab : 采纳 Copilot 代码建议

<Space> + f + t : 弹出浮动终端运行 Claude Code

### 🎨 视觉调优 (Visuals)
为了获得最佳视觉体验，推荐以下配置：

主题 (Theme): Tokyo Night / Catppuccin

字体 (Font): JetBrainsMono Nerd Font

透明度 (Opacity): 15% (Acrylic 效果)

### 🤝 贡献与维护
这个项目将持续更新，以跟进最新的 AI 开发工具和 Rust 生产力工具。

欢迎提交 Issue 或 Pull Request 来完善这个“Vibe 空间”！

📜 许可证
MIT License
