![](https://raw.githubusercontent.com/wedfrgt/nvim/master/demo.png)

强烈建议**仔细看看**配置文件，而不是直接复制! 只阅读此文档也是不够的

至少因为在快捷键一栏中，只显示了修改过的键位，所以你需要知道没修改过的键位

- [依赖](#依赖)
- [安装之后你需要做的](#安装之后你需要做的)
  - [首先](#首先)
  - [对于 Vista](#对于-vista)
  - [对于 FZF](#对于-fzf)
  - [对于 coc](#对于-coc)
  - [对于 ranger](#对于-ranger)
- [快捷键](#快捷键)
  - [基础编辑器特性](#基础编辑器特性)
    - [基础输入](#基础输入)
      - [值得注意](#值得注意)
    - [光标移动](#光标移动)
    - [搜索](#搜索)
    - [窗口操作](#窗口操作)
    - [buffer 操作](#buffer-操作)
    - [tab 操作](#tab-操作)
    - [其他](#其他)
  - [插件快捷键](#插件快捷键)
    - [自动补全](#自动补全)
      - [coc](#coc)
      - [coc-snippets](#coc-snippets)
    - [文件浏览](#文件浏览)
      - [coc-explorer](#coc-explorer)
      - [ranger](#ranger)
      - [fzf](#fzf)
      - [lua-line](#lua-line)
    - [导航](#导航)
      - [vista](#vista)
    - [git 操作](#git-操作)
      - [gitgutter](#gitgutter)

## 依赖

- 本配置文件依赖于 Neovim 0.8.0+

## 安装之后你需要做的

### 首先

- 执行`:PlugInstall`，安装插件
- 执行`:checkhealth`，检查是否报错，并解决

### 对于 Vista

- 安装`ctags`

### 对于 FZF

- 安装`fzf`

### 对于 coc

- 安装`NodeJS`

### 对于 ranger

- 安装`ranger`

## 快捷键

### 基础编辑器特性

#### 基础输入

- `h`: 代替了`i`
- `W`: 保存文件(:w)
- `Q`: 退出文件，不保存(:q)

##### 值得注意

由于`h`键改为了`i`键，因此所有包含`i`键的基础命令都要改为`h`键(包括`H`和`I`的关系)

#### 光标移动

| 快捷键 | 行为             |
| ------ | ---------------- |
| j      | 光标向左移动一格 |
| l      | 光标向右移动一格 |
| i      | 光标向上移动一格 |
| k      | 光标向下移动一格 |

#### 搜索

| 快捷键          | 行为                                 |
| --------------- | ------------------------------------ |
| `SPACE` `ENTER` | 关闭`/`键的搜索高亮                  |
| -               | 显示前一个搜索结果，并居中到屏幕中间 |
| =               | 显示后一个搜索结果，并居中到屏幕中间 |

#### 窗口操作

- 注意: 这里与光标移动不同，因为我不想改<C-i>

| 快捷键     | 行为             |
| ---------- | ---------------- |
| `ctrl` `h` | 移动到左边的窗口 |
| `ctrl` `l` | 移动到右边的窗口 |
| `ctrl` `k` | 移动到上边的窗口 |
| `ctrl` `j` | 移动到下边的窗口 |

#### buffer 操作

| 快捷键 | 行为             |
| ------ | ---------------- |
| bn     | 下一个`buffer`   |
| bp     | 前一个`buffer`   |
| bq     | 退出当前`buffer` |

#### tab 操作

| 快捷键 | 行为               |
| ------ | ------------------ |
| tt     | 跳转下一个窗口     |
| tT     | 跳转前一个窗口     |
| tn     | 创建空窗口         |
| tmj    | 将当前窗口向前移动 |
| tml    | 将当前窗口向后移动 |

#### 其他

| 快捷键     | 行为                        |
| ---------- | --------------------------- |
| R          | 刷新`VIMRC`                 |
| `ctrl` `g` | 快速打开`lazygit`(需先安装) |

### 插件快捷键

#### 自动补全

##### coc

| 快捷键      | 行为               |
| ----------- | ------------------ |
| `SPACE` `,` | 向前查找报错       |
| `SPACE` `.` | 向后查找报错       |
| gd          | 跳转到函数定义位置 |

##### coc-snippets

| 快捷键    | 行为                     |
| --------- | ------------------------ |
| `alt` `l` | 在一个代码片段中前移光标 |
| `alt` `j` | 在一个代码片段中后移光标 |

#### 文件浏览

##### coc-explorer

| 快捷键      | 行为                                 |
| ----------- | ------------------------------------ |
| `SPACE` `e` | 打开`coc-explorer`                   |
| `SPACE` `v` | 以`coc-explorer`打开`vimrc`的位置    |
| `SPACE` `f` | 以浮动窗口打开`coc-explorer`         |
| h           | 选中文件                             |
| `TAB`       | 动作菜单                             |
| c           | 打开并进入选中文件夹                 |
| `ENTER`     | 打开或折叠文件夹，遇到文件时直接打开 |
| s           | 将选中文件以上下分割窗口打开         |
| v           | 将选中文件以左右分割窗口打开         |
| tt          | 将选中文件打开至`buffer`             |
| `BACKSPACE` | 显示上一级目录                       |
| yp          | 复制文件路径                         |
| yn          | 复制文件名字                         |
| ?           | 帮助菜单                             |
| q           | 退出                                 |
| `ESC`       | 退出                                 |
| f           | 模糊搜索当前目录                     |
| F           | 递归地搜索当前目录                   |
| b           | 跳转至`BUFFER`列表                   |
| B           | 跳转至`FILE`列表                     |
| gs          | 返回打开的文件的目录                 |
| r           | 切换是否显示隐藏文件                 |

##### ranger

| 快捷键          | 行为               |
| --------------- | ------------------ |
| `SPACE` `SPACE` | 打开或关闭`ranger` |

##### fzf

| 快捷键     | 行为                      |
| ---------- | ------------------------- |
| `ctrl` `p` | 打开`fzf`模糊搜索文件     |
| `ctrl` `b` | 打开`fzf`模糊搜索`buffer` |

##### lua-line

| 快捷键        | 行为                 |
| ------------- | -------------------- |
| `SPACE`加数字 | 跳转至数字指示的文件 |

#### 导航

##### vista

| 快捷键  | 行为                          |
| ------- | ----------------------------- |
| `\` `\` | 打开或关闭 vista              |
| `\` `f` | 强制打开 vista 的标签搜索功能 |

- 注意: 由于`\` `f`是强制打开，所以在打开非可识别的文件时可能会出问题

#### git 操作

##### gitgutter

| 快捷键          | 行为                                   |
| --------------- | -------------------------------------- |
| `SPACE` `g` `p` | 预览当前`git`代码块的详细状态          |
| `SPACE` `g` `s` | 将当前的`git`代码块添加至暂存区(stage) |
| g[              | 向前跳转`git`代码块                    |
| g]              | 向后跳转`git`代码块                    |
