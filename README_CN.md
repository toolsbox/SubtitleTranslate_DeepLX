# SubtitleTranslate_DeepLX

SubtitleTranslate_DeepLX 是一个开源项目，通过调用 [DeepLX-with-proxy](https://github.com/toolsbox/DeepLX-with-proxy) 提供的 API，实现 PotPlayer 字幕的实时翻译。该项目旨在帮助用户无需手动翻译字幕，即可在观看视频时享受多语言体验。

## 特性

- **实时翻译：** 在视频播放过程中自动翻译字幕，为用户提供无缝的观看体验。
- **PotPlayer 集成：** 与 PotPlayer 紧密结合，提高观影体验。
- **API 支持：** 使用 DeepLX-with-proxy API 实现高效、精准的翻译。

## 前置条件

- 需要在系统上安装 [PotPlayer](https://potplayer.daum.net/)。
- 需要访问 DeepLX-with-proxy API，请按照其仓库说明进行设置。
- 需要稳定的网络连接，以实现实时翻译功能。

## 安装

1. **克隆仓库：**

   ```bash
   git clone https://github.com/toolsbox/SubtitleTranslate_DeepLX.git
   cd SubtitleTranslate_DeepLX
   ```

2. **将翻译文件复制到 PotPlayer 目录：**

   复制 `SubtitleTranslate - DeepLX.as` 和 `SubtitleTranslate - DeepLX.ico` 到 PotPlayer 安装目录下的以下路径：
   
   ```
   <PotPlayer 安装目录>/Extension/Subtitle/Translate
   ```

3. **配置 API：**

   - 请按照 [DeepLX-with-proxy](https://github.com/toolsbox/DeepLX-with-proxy) 项目的说明设置翻译 API。
   - 根据需要更新配置文件或环境变量。

4. **在 PotPlayer 中加载扩展功能**
   
   - 打开 PotPlayer。
   - 右键点击播放界面，选择 **“字幕”** -> 勾选 **“显示字幕”** 确保字幕已加载。
   - 右键点击播放界面，选择 **“字幕”** -> **“字幕翻译”** -> **“在线字幕翻译设置...”**。
   - 配置相应的 API 地址。

## 贡献

欢迎大家参与贡献！如果你有建议、问题反馈或改进方案，请提交 Issue 或 Pull Request。

## 许可证

本项目采用 [MIT 许可证](https://github.com/toolsbox/SubtitleTranslate_DeepLX?tab=MIT-1-ov-file) 进行开源。

## 鸣谢

- [DeepLX-with-proxy](https://github.com/toolsbox/DeepLX-with-proxy) – 提供强大的翻译 API。
- 感谢所有开源社区的支持与贡献。
