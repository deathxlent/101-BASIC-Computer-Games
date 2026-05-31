# 101 BASIC Computer Games — HTML Edition

[English](#english) | [中文](#中文)

---

<a id="english"></a>
## 📖 Overview

**101 BASIC Computer Games** is a HTML port of the classic 1970s book by David H. Ahl, which introduced millions of people to programming. This project brings all 101 games (plus 7 bonus programs) to the browser, preserving the original terminal aesthetic and gameplay logic.

Each game runs in a retro terminal emulator built with vanilla JavaScript — no frameworks, no dependencies. Games are playable directly in any modern browser.

### 🎮 What's Inside

- **108 game programs** — all 101 from the original book + 7 bonus programs
- **Dual-language menu** — English (`index.html`) and Chinese (`index_zh.html`)
- **Original BASIC sources** linked via a git submodule pointing to [maurymarkowitz/101-BASIC-Computer-Games](https://github.com/maurymarkowitz/101-BASIC-Computer-Games)
- **Terminal emulator** — a lightweight `BasicTerminal` class that handles I/O with a retro green-on-black CRT aesthetic
- **Zero dependencies** — pure HTML, CSS, and JavaScript

### 🕹️ How to Play

Browse the game list on `index.html` or `index_zh.html`, click **Play / 开始游戏** on any ported game, and the classic BASIC experience runs right in your browser.

Game categories include:

| Category | Examples |
|---|---|
| 🧩 Puzzle | 1CHECK, CHIMP, CHOM, TOWER, REVERSE |
| 🃏 Card | ACEYDU, BLACKJACK, CRAPS, POKER |
| 🏀 Sports | BASBAL, BASKET, BOWL, BOXING, GOLF |
| 🧠 Strategy | BATTLE, NIM, GOMOKO, QUBIC, SALVO |
| 🎰 Casino | ROULET, SLOTS, YAHTZE |
| 🚀 Simulation | LUNAR, ROCKET, BOMBER, CIVIL WAR |
| 📐 Demo/Art | 3DPLOT, BANNER, BOUNCE, DIAMND |

### 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| UI | HTML5 + CSS3 |
| Engine | Vanilla JavaScript (`BasicTerminal` class) |
| Styling | Terminal-inspired green-on-black theme |
| BASIC Sources | Git submodule — external reference only |

### 📁 Project Structure

```
├── index.html            # English game menu (108 games)
├── index_zh.html         # Chinese game menu
├── css/terminal.css      # Retro terminal styling
├── js/terminal.js        # BasicTerminal engine class
├── games/*.html          # Individual game pages (108 total)
└── maurymarkowitz/       # Git submodule: original BASIC sources
    └── 101-BASIC-Computer-Games/
```

### ▶️ Running Locally

Simply serve the root directory with any static file server:

```bash
# Python
python -m http.server 8080

# Node.js (npx)
npx serve .

# Live Server (VS Code)
# Right-click index.html → Open with Live Server
```

Then open `http://localhost:8080/index.html` in your browser.

### 📜 License

The HTML ports and terminal engine are provided as an educational and nostalgic resource. The original BASIC source code is authored by David H. Ahl and contributors and is referenced via the [maurymarkowitz repository](https://github.com/maurymarkowitz/101-BASIC-Computer-Games).

---

<a id="中文"></a>
## 📖 简介

**101款BASIC电脑游戏** 是1970年代经典同名书籍（David H. Ahl 著）的 **HTML移植版**。这本书曾让数百万人第一次接触到编程。本项目将全部 101 个游戏（外加 7 个额外程序）搬到了浏览器中，保留了原始的终端视觉风格和游戏逻辑。

每个游戏都在一个用纯 JavaScript 编写的复古终端模拟器中运行 —— 无框架、无依赖，在任何现代浏览器中均可直接游玩。

### 🎮 项目内容

- **108 个游戏程序** — 原书全部 101 个游戏 + 7 个额外程序
- **双语菜单** — 英文 (`index.html`) 和中文 (`index_zh.html`)
- **原始 BASIC 源码** — 通过 git 子模块链接到 [maurymarkowitz/101-BASIC-Computer-Games](https://github.com/maurymarkowitz/101-BASIC-Computer-Games)
- **终端模拟器** — 轻量级 `BasicTerminal` 类，实现绿字黑底 CRT 复古终端 I/O
- **零依赖** — 纯 HTML、CSS 和 JavaScript

### 🕹️ 如何游玩

在 `index.html` 或 `index_zh.html` 上浏览游戏列表，点击任意已移植游戏的 **Play / 开始游戏**，经典的 BASIC 体验就会在浏览器中直接运行。

游戏类别包括：

| 类别 | 示例 |
|---|---|
| 🧩 益智 | 单人跳棋、咬饼干、汉诺塔、反转排序 |
| 🃏 纸牌 | 艾斯杜西、21点、双骰子、扑克 |
| 🏀 体育 | 棒球、篮球、保龄球、拳击、高尔夫 |
| 🧠 策略 | 海战、尼姆游戏、五子棋、三维井字棋、齐射海战 |
| 🎰 赌场 | 轮盘赌、老虎机、快艇骰子 |
| 🚀 模拟 | 火箭、轰炸机、南北战争、轨道计算 |
| 📐 演示/艺术 | 3D曲面图、横幅制作、弹跳球、钻石图案 |

### 🛠️ 技术栈

| 层 | 技术 |
|---|---|
| 界面 | HTML5 + CSS3 |
| 引擎 | 原生 JavaScript（`BasicTerminal` 类） |
| 样式 | 终端风格绿字黑底主题 |
| BASIC 源码 | Git 子模块 — 仅用作外部参考 |

### 📁 项目结构

```
├── index.html            # 英文游戏菜单（108个游戏）
├── index_zh.html         # 中文游戏菜单
├── css/terminal.css      # 复古终端样式
├── js/terminal.js        # BasicTerminal 引擎类
├── games/*.html          # 单个游戏页面（共108个）
└── maurymarkowitz/       # Git 子模块：原始 BASIC 源码
    └── 101-BASIC-Computer-Games/
```

### ▶️ 本地运行

使用任意静态文件服务器托管根目录即可：

```bash
# Python
python -m http.server 8080

# Node.js (npx)
npx serve .

# Live Server（VS Code）
# 右键 index.html → 用 Live Server 打开
```

然后在浏览器中打开 `http://localhost:8080/index.html`。

### 📜 许可

HTML 移植版及终端引擎作为教育和怀旧资源提供。原始 BASIC 源码由 David H. Ahl 及其贡献者编写，通过 [maurymarkowitz 仓库](https://github.com/maurymarkowitz/101-BASIC-Computer-Games) 引用。
