# SubtitleTranslate_DeepLX

SubtitleTranslate_DeepLX is an open-source project that provides real-time subtitle translation for [PotPlayer](https://potplayer.daum.net/) by leveraging the API from [DeepLX-with-proxy](https://github.com/toolsbox/DeepLX-with-proxy). This project is designed to help users enjoy video content in different languages without the need for manual subtitle translation.

## Features

- **Real-Time Translation:** Automatically translates subtitles on the fly during video playback.
- **PotPlayer Integration:** Seamlessly works with PotPlayer to enhance your viewing experience.
- **API-Powered:** Utilizes the DeepLX-with-proxy API for robust and efficient translation.

## Prerequisites

- [PotPlayer](https://potplayer.daum.net/) installed on your system.
- Access to the DeepLX-with-proxy API. Make sure you have it set up as described in its repository.
- A working internet connection to fetch translations in real-time.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/toolsbox/SubtitleTranslate_DeepLX.git
   cd SubtitleTranslate_DeepLX

2. **Copy Translation Files to PotPlayer:**

    Copy SubtitleTranslate - DeepLX.as and SubtitleTranslate - DeepLX.ico to the following directory in your PotPlayer installation:
    ```mathematica
    <PotPlayer Install Directory>/Extension/Subtitle/Translate

3. **Configure the API:**

    - Follow the instructions provided in the [DeepLX-with-proxy](https://github.com/toolsbox/DeepLX-with-proxy) repository to set up the translation API. 
    - Update any configuration files or environment variables as needed.

4. **Load the extension in otPlayer**
    - Open PotPlayer.
    - Right-click on the playback interface and select "Subtitles" -> check "Show Subtitles" to ensure subtitles are - loaded.
    - Then, Right-click on the playback interface and select "Subtitles" -> "Subtitle Translation" -> "Online Subtitle Translation Settings.."
    - Configure the corresponding API URL.

## Contributing
Contributions are welcome! If you have suggestions, bug reports, or improvements, please open an issue or submit a pull request.

## License
This project is open-source and available under the [MIT License](https://github.com/toolsbox/SubtitleTranslate_DeepLX?tab=MIT-1-ov-file).

## Acknowledgements
- [DeepLX-with-proxy](https://github.com/toolsbox/DeepLX-with-proxy)  – for providing the powerful translation API.
- The open-source community for their ongoing support and contributions.