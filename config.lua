-- =================================================================
-- D3XL FiveM Standalone Notification Configuration File (Lua)
-- Author: d3xl
-- =================================================================

Config = {}

-- Position on screen: "top-right", "top-left", "bottom-right", "bottom-left"
Config.Position = "top-right"

-- Default display duration in milliseconds (5000 = 5 seconds)
Config.DefaultDuration = 5000

-- Sound Effect (true = enabled audio pop sound, false = silent)
Config.EnableSound = true

-- Framework Integration Toggles (Set to true or false)
Config.EnableQBCoreNotify = true    -- Overrides QBCore:Notify (true/false)
Config.EnableESXNotify    = true    -- Overrides esx:showNotification (true/false)
Config.EnableOxLibNotify  = true    -- Overrides ox_lib:notify (true/false)
Config.EnableQbxNotify    = true    -- Overrides qbx:notify (true/false)

-- Test Command Toggle (true/false)
Config.EnableTestCommand  = true    -- Enables /testnotify chat command (true/false)

-- Preset Notification Types Customization (Title, Icon, Color & Enable status)
Config.Types = {
    ['success'] = {
        title = "BAŞARILI",
        icon = "fa-circle-check",
        color = "#36FF9F",
        enabled = true
    },
    ['info'] = {
        title = "BİLGİLENDİRME",
        icon = "fa-circle-info",
        color = "#00f0ff",
        enabled = true
    },
    ['warning'] = {
        title = "UYARI",
        icon = "fa-triangle-exclamation",
        color = "#ffaa00",
        enabled = true
    },
    ['error'] = {
        title = "HATA",
        icon = "fa-circle-xmark",
        color = "#ff0055",
        enabled = true
    },
    ['event'] = {
        title = "ETKİNLİK",
        icon = "fa-trophy",
        color = "#36FF9F",
        enabled = true
    },
    ['announcement'] = {
        title = "DUYURU",
        icon = "fa-bullhorn",
        color = "#00f0ff",
        enabled = true
    }
}
