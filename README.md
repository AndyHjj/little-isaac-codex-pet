# 小以撒 Codex 宠物 / Little Isaac Codex Pet

一个为 Codex 制作的非官方《以撒的结合》同人动态宠物。它包含闲置、移动、挥手、跳跃、失败、等待、工作、审查和环视等动画。

An unofficial, non-commercial fan-made animated pet for Codex, inspired by *The Binding of Isaac*.

![小以撒闲置动画](previews/idle.gif)

## 安装

需要支持自定义 v2 宠物的 Codex 版本。Windows 用户可使用 PowerShell 7：

```powershell
git clone https://github.com/AndyHjj/little-isaac-codex-pet.git
pwsh -File .\little-isaac-codex-pet\install.ps1
```

安装脚本会把现有的同名宠物备份后，将这两个文件复制到 `%USERPROFILE%\.codex\pets\little-isaac`：

- `pet.json`
- `spritesheet.webp`

也可以手动复制这两个文件。安装后请重新启动 Codex。

## 动画预览

| 状态 | 预览 |
| --- | --- |
| 闲置 | ![idle](previews/idle.gif) |
| 左右移动 | ![running left](previews/running-left.gif) ![running right](previews/running-right.gif) |
| 挥手 | ![waving](previews/waving.gif) |
| 跳跃 | ![jumping](previews/jumping.gif) |
| 工作 | ![working](previews/running.gif) |
| 等待 | ![waiting](previews/waiting.gif) |
| 审查 | ![review](previews/review.gif) |
| 失败 | ![failed](previews/failed.gif) |

完整图集见 [contact-sheet.png](previews/contact-sheet.png)。

## 宠物规格

- Codex pet manifest：`spriteVersionNumber: 2`
- 图集：8 列 × 11 行
- 单元格：192 × 208 px
- 总尺寸：1536 × 2288 px
- 格式：带透明通道的 WebP
- 9 个标准状态动画 + 16 个环视方向

验证记录与文件哈希见 [VALIDATION.md](VALIDATION.md)。

## 素材边界

这个仓库只包含可安装宠物、由其生成的预览和发布文档，不包含：

- 游戏原始素材或官方立绘
- 哔哩哔哩视频、视频帧或下载文件
- 其他作者的二创原图
- 生成提示词、参考图和中间候选图

## 许可与声明

本项目是非官方、非商业同人项目，与 Edmund McMillen、Florian Himsl、Nicalis、*The Binding of Isaac* 官方、OpenAI 或 Codex 官方均无从属或背书关系。

安装脚本、配置和文档中的原创代码部分使用 [MIT 许可](LICENSE-CODE)。`spritesheet.webp` 及预览图不适用 MIT；其使用边界见 [ASSET-NOTICE.md](ASSET-NOTICE.md)。由于宠物使用了第三方角色形象，本仓库属于公开可查看、可修改的同人项目，但视觉素材并非 OSI 意义上的完全开源素材。

相关角色、名称、商标和游戏知识产权归各自权利人所有。权利人如认为本仓库需要调整署名、许可说明或下架内容，请通过 GitHub Issue 联系。
