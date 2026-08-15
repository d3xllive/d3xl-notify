<div align="center">

# 🔔 D3XL Notification System V1

### Ultra Modern, Standalone, Cyberpunk Toast Notification System for FiveM


[![FiveM](https://img.shields.io/badge/FiveM-b3751%2B-brightgreen?style=for-the-badge&logo=fivem&logoColor=white)](https://fivem.net)
[![Framework](https://img.shields.io/badge/Framework-QBCore%20%7C%20Qbox%20%7C%20ESX%20%7C%20Standalone-00f0ff?style=for-the-badge)](https://github.com/d3xllive/d3xl-notify)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

---

</div>

## ✨ Key Features

- 🎨 **tgiann.com Neon Color Palette**: Built-in HSL Tailored Neon Mint (`#36FF9F`), Cyan (`#00f0ff`), Amber (`#ffaa00`), and Pink (`#ff0055`).
- ⏳ **Dynamic Countdown Progress Bar**: Animated progress bar on each notification card indicating remaining duration.
- 🔮 **Zero-Black-Box NUI Glassmorphism**: Clean 16px oval rounded glass cards with `100%` transparent NUI viewport (Zero CEF black bounding box).
- 🔊 **Web Audio API Synthesizer**: Built-in sound generator with ZERO external MP3/OGG asset dependencies. Toggleable via `config.lua`.
- ⚡ **Universal Framework Compatibility**: Out-of-the-box drop-in replacement for **QBCore**, **Qbox (`qbx_core`)**, **ESX**, and **`ox_lib`**.
- 🛠️ **Config Driven (`config.lua`)**: Toggle framework overrides, sound effects, positions, and preset notification types with `true` / `false`.

---

## 🚀 Installation

1. Download or clone this repository:
   ```bash
   git clone https://github.com/d3xllive/d3xl-notify.git
   ```
2. Place the folder into your server's `resources` directory:
   ```
   resources/d3xl-notify
   ```
3. Add the resource to your `server.cfg`:
   ```cfg
   ensure d3xl-notify
   ```

---

## 💻 Export & Event Usage

### Client Export Syntax

```lua
-- Full Syntax: exports['d3xl-notify']:SendNotify(title, message, subtext, type, duration)

-- Event Notification (Neon Mint)
exports['d3xl-notify']:SendNotify('Event', 'King of the Mountain', 'There can only be one survivor!', 'event', 6000)

-- Announcement Notification (Cyan)
exports['d3xl-notify']:SendNotify('CLOUDSCRIPTS', 'You can find this script in Tebex Shop', 'CLOUDSCRIPTS.TEBEX.IO', 'announcement', 6000)

-- Success Notification
exports['d3xl-notify']:SendNotify('BAŞARILI', 'Araç kilidi başarıyla açıldı.', 'Plaka: 34 D3XL 88', 'success', 5000)

-- Simple Single Line Export Alias
exports['d3xl-notify']:Notify('Benzininiz tükenmek üzere!', 'warning', 5000)
```

### Server Export Syntax

```lua
-- Send notification to specific player or all players (-1)
exports['d3xl-notify']:SendNotify(targetPlayerId, title, message, subtext, type, duration)
```

---

## ⚙️ Configuration (`config.lua`)

```lua
Config = {}

-- Screen Position: "top-right", "top-left", "bottom-right", "bottom-left"
Config.Position = "top-right"

-- Default display duration in milliseconds (5000 = 5s)
Config.DefaultDuration = 5000

-- Audio Toggle (true = enabled, false = silent)
Config.EnableSound = true

-- Framework Overrides (true / false)
Config.EnableQBCoreNotify = true
Config.EnableESXNotify    = true
Config.EnableOxLibNotify  = true
Config.EnableQbxNotify    = true
Config.EnableTestCommand  = true
```

---

## 🎮 In-Game Test Command

Type `/testnotify` in chat to trigger a sequential showcase of all 5 notification card types!

---

<div align="center">

Developed with ❤️ by **d3xl / D3XL SCRIPTS**

</div>
