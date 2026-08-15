-- =================================================================
-- D3XL FiveM Standalone Notification Client Script
-- Config Driven Engine (QBCore, Qbox, ESX, ox_lib, Standalone)
-- Author: d3xl
-- =================================================================

Config = Config or {}
Config.Types = Config.Types or {}

-- Core Client Export & Function
function SendNotify(title, message, subtext, type, duration)
    local nType = (type or 'info'):lower()
    local typeCfg = Config.Types and Config.Types[nType]
    
    if typeCfg and typeCfg.enabled == false then
        return -- Notification type disabled in config.lua
    end

    SendNUIMessage({
        action = 'notify',
        title = title or (typeCfg and typeCfg.title),
        message = message,
        subtext = subtext,
        type = nType,
        color = typeCfg and typeCfg.color,
        icon = typeCfg and typeCfg.icon,
        duration = duration or Config.DefaultDuration or 5000,
        position = Config.Position or 'top-right',
        sound = Config.EnableSound
    })
end

-- Standalone Exports
exports('SendNotify', SendNotify)
exports('Notify', function(message, type, duration)
    SendNotify(nil, message, nil, type, duration)
end)

-- 1. Native D3XL Net Event
RegisterNetEvent('d3xl-notify:send', function(title, message, subtext, type, duration)
    SendNotify(title, message, subtext, type, duration)
end)

-- 2. QBCore Compatibility Event
RegisterNetEvent('QBCore:Notify', function(text, type, length)
    if Config.EnableQBCoreNotify ~= false then
        local t = (type or 'info'):lower()
        if t == 'primary' then t = 'info' end
        SendNotify(nil, text, nil, t, length or Config.DefaultDuration)
    end
end)

-- 3. ESX Compatibility Event
RegisterNetEvent('esx:showNotification', function(message, type, length)
    if Config.EnableESXNotify ~= false then
        local t = (type or 'info'):lower()
        SendNotify(nil, message, nil, t, length or Config.DefaultDuration)
    end
end)

-- 4. ox_lib Compatibility Event
RegisterNetEvent('ox_lib:notify', function(data)
    if Config.EnableOxLibNotify ~= false and type(data) == 'table' then
        local t = (data.type or 'info'):lower()
        if t == 'inform' then t = 'info' end
        SendNotify(data.title, data.description or data.text, data.caption, t, data.duration or Config.DefaultDuration)
    end
end)

-- 5. Qbox Compatibility Event
RegisterNetEvent('qbx:notify', function(message, type, duration)
    if Config.EnableQbxNotify ~= false then
        SendNotify(nil, message, nil, type or 'info', duration or Config.DefaultDuration)
    end
end)

-- In-Game Test Command
if Config.EnableTestCommand ~= false then
    RegisterCommand('testnotify', function(source, args)
        Citizen.CreateThread(function()
            SendNotify('Event', 'King of the Mountain', 'There can only be one survivor!', 'event', 6000)
            Citizen.Wait(250)
            SendNotify('CLOUDSCRIPTS', 'You can find this script in the Tebex Shop or in the Discord', 'CLOUDSCRIPTS.TEBEX.IO', 'announcement', 6000)
            Citizen.Wait(250)
            SendNotify('BAŞARILI', 'Araç kilidi başarıyla açıldı.', 'Plaka: 34 D3XL 88', 'success', 5000)
            Citizen.Wait(250)
            SendNotify('UYARI', 'Benzininiz tükenmek üzere!', 'Kalan Depo: %5', 'warning', 5000)
            Citizen.Wait(250)
            SendNotify('HATA', 'Yeterli paranız bulunmuyor!', 'Gerekli: $5,000', 'error', 5000)
        end)
    end, false)
end
