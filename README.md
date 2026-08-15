<div align="center">

# 🔔 D3XL Notification System V1

### Ultra Modern, Standalone, Cyberpunk Toast Notification System for FiveM

[![FiveM](https://img.shields.io/badge/FiveM-b3751%2B-brightgreen?style=for-the-badge&logo=fivem&logoColor=white)](https://fivem.net)
[![Framework](https://img.shields.io/badge/Framework-QBCore%20%7C%20Qbox%20%7C%20ESX%20%7C%20Standalone-00f0ff?style=for-the-badge)](https://github.com/d3xllive/d3xl-notify)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

---

</div>

## ✨ Key Features

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

## 💻 Client Example Usage (`examples/example_client.lua`)

```lua
-- 1. Full Custom Notification (Title, Message, Subtext, Type, Duration)
exports['d3xl-notify']:SendNotify('ETKİNLİK', 'King of the Mountain Başladı!', 'Konum: Mount Chiliad', 'event', 6000)

-- 2. Simple Single Line Notification
exports['d3xl-notify']:Notify('Aracınız başarıyla tamir edildi!', 'success', 4000)

-- 3. QBCore / Qbox Native Event Override
TriggerEvent('QBCore:Notify', 'Envanteriniz doldu!', 'error', 5000)

-- 4. ESX Native Event Override
TriggerEvent('esx:showNotification', 'Benzin istasyonuna ulaştınız.', 'info', 4000)

-- 5. ox_lib Native Event Override
TriggerEvent('ox_lib:notify', {
    title = 'DUYURU',
    description = 'Sunucu bakımı 10 dakika sonra başlayacaktır.',
    caption = 'D3XL ROLEPLAY',
    type = 'announcement',
    duration = 7000
})
```

---

## 🖥️ Server Example Usage (`examples/example_server.lua`)

```lua
-- 1. Send Notification to a Specific Player (targetPlayerId)
exports['d3xl-notify']:SendNotify(targetPlayerId, 'YETKİLİ', 'Hesabınıza $50,000 tanımlandı!', 'D3XL BANK', 'success', 6000)

-- 2. Send Announcement to ALL Online Players (targetId = -1)
exports['d3xl-notify']:SendNotify(-1, 'DUYURU', 'Sunucu yeniden başlatılıyor!', 'D3XL SERVER', 'announcement', 8000)
```

---

## ⚙️ Configuration (`config.lua`)

```lua
Config = {}

-- Screen Position: "top-right", "top-left", "bottom-right", "bottom-left"
Config.Position = "top-right"

-- Default display duration in milliseconds (5000 = 5s)
Config.DefaultDuration = 5000

-- Audio Toggle (true = enabled sound, false = silent)
Config.EnableSound = true

-- Framework Integration Toggles (true / false)
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
