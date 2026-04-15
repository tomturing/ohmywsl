# ⚡ OH-MY-WSL

> **Build your terminal like a high-performance Rust engine.**

---

### 🗺️ Architecture Layout

| 层级 | 工具 | 角色 | 核心 Vibe (感官体验) |
| :--- | :--- | :--- | :--- |
| **底层宿主** | Windows Terminal + WSL2 | 容器与渲染 | GPU 加速渲染，极致丝滑的文字滚动。 |
| **空间管理** | Zellij + Yazi | 布局与多任务 | 像 IDE 一样的分屏，再也不用鼠标点来点去。 |
| **交互逻辑** | Fish + Starship | 命令与反馈 | 预测性补全 + 极速状态感知。 |
| **高效命令** | Zoxide + Atuin + LSD/Eza | 导航与记忆 | 肌肉记忆的终结者。不再翻找历史，不再输入长路径。 |
| **生产力核心** | LazyVim + Claude Code | 编辑与思考 | Copilot 写代码，Claude Code 跑 Agent。 |

---

### 🚀 Quick Start

```bash
curl -sSL [https://raw.githubusercontent.com/tomturing/ohmywsl/main/setup.sh](https://raw.githubusercontent.com/tomturing/ohmywsl/main/setup.sh) | bash
