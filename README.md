<div align="center">

# Asado 🔥

**A macOS menu bar app that watches your CPU and screams when things get hot.**

[![GitHub release](https://img.shields.io/github/v/release/FranAlarza/Asado)](https://github.com/FranAlarza/Asado/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-14%2B-blue)](https://github.com/FranAlarza/Asado/releases/latest)
[![Swift](https://img.shields.io/badge/Swift-6-orange)](https://swift.org)
[![License](https://img.shields.io/github/license/FranAlarza/Asado)](LICENSE)

<!-- Screenshot: menu bar popover showing CPU % and process list -->
![Asado popover](assets/screenshots/popover.png)

</div>

---

## What is Asado?

Asado lives in your menu bar and monitors your Mac's CPU in real time. When usage climbs past a configurable threshold it plays an alert sound so you know something is cooking — without having to keep Activity Monitor open.

It also shows a live list of the top CPU-consuming processes directly in the popover, so you always know what's responsible.

---

## Features

- 🌡️ **Real-time CPU monitoring** — reads system CPU usage every few seconds and displays it in the menu bar popover
- 🔔 **Threshold alerts** — plays a sound when CPU exceeds your configured threshold (default 90%)
- 📋 **Top process list** — shows the 5 processes consuming the most CPU, with app icons and usage percentages, always visible
- 🔇 **Configurable sounds** — choose from bundled alert sounds or import your own (MP3, WAV, AIFF, M4A)
- 🎚️ **Adjustable threshold** — slider from 50% to 100% in the Settings window
- 🚀 **Auto-launch on install** — the PKG installer opens the app automatically after installation

---

## Screenshots

<div align="center">

<!-- Screenshot: menu bar icon and popover with process list -->
| Popover | Settings |
|---------|----------|
| ![Popover](assets/screenshots/popover.png) | ![Settings](assets/screenshots/settings.png) |

</div>

---

## Installation

### PKG Installer (recommended)

1. Download `Asado-v0.0.1.pkg` from the [latest release](https://github.com/FranAlarza/Asado/releases/latest)
2. Open the `.pkg` file and follow the installer steps
3. Asado launches automatically when the installation completes

> **Note:** macOS will ask for your password during installation since the PKG copies the app to `/Applications`.

### Manual

1. Download and unzip `Asado.zip` from the [releases page](https://github.com/FranAlarza/Asado/releases)
2. Drag `Asado.app` to your `/Applications` folder
3. Open it from Launchpad or Spotlight

---

## Usage

Once running, Asado appears as a flame icon in your menu bar.

**Click the icon** to open the popover:

- The top line shows current CPU usage as a percentage
- Below it, a live list of the top processes ordered by CPU consumption — icon, name, and usage %
- Use the **gear icon** to open Settings
- Use **Quit** to exit

### Configuring alerts

Open **Settings** (gear icon in the popover):

| Setting | Description |
|---------|-------------|
| **Sound alerts** | Enable or disable the audio alert entirely |
| **CPU Threshold** | The percentage at which the alert fires (50–100%) |
| **Alert sound** | Choose from bundled sounds or import a custom file |
| **Preview** | Play the selected sound to hear how it sounds |

To add a custom sound click the **+** button next to "Alert sound" and select an audio file (MP3, WAV, AIFF, or M4A).

---

## Requirements

- macOS 14 Sonoma or later
- Apple Silicon or Intel Mac

---

## Building from source

```bash
git clone https://github.com/FranAlarza/Asado.git
cd Asado
open Asado.xcodeproj
```

Then build and run the `Asado` scheme in Xcode.

**Run tests:**

```bash
xcodebuild -scheme Asado -only-testing AsadoTests test
```

---

## Contributing

Contributions are welcome. Please open an issue before submitting a pull request so we can discuss the change first.

1. Fork the repo
2. Create a feature branch (`git checkout -b feat/my-feature`)
3. Commit your changes
4. Open a pull request

---

## License

MIT. See [LICENSE](LICENSE) for details.
