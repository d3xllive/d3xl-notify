-- =================================================================
-- D3XL Notification System - Client Usage Examples
-- Place these snippets inside any client-side script in your server
-- =================================================================

-- Example 1: Standalone Export Notification with Custom Title, Message & Subtext
RegisterCommand('notifytest1', function()
    exports['d3xl-notify']:SendNotify('ETKİNLİK', 'King of the Mountain Başladı!', 'Konum: Mount Chiliad', 'event', 6000)
end, false)

-- Example 2: Simple Single-Line Notification (Auto Title from Type)
RegisterCommand('notifytest2', function()
    exports['d3xl-notify']:Notify('Aracınız başarıyla tamir edildi!', 'success', 4000)
end, false)

-- Example 3: QBCore / Qbox Native Trigger
RegisterCommand('notifytest3', function()
    TriggerEvent('QBCore:Notify', 'Envanteriniz doldu!', 'error', 5000)
end, false)

-- Example 4: ESX Native Trigger
RegisterCommand('notifytest4', function()
    TriggerEvent('esx:showNotification', 'Benzin istasyonuna ulaştınız.', 'info', 4000)
end, false)

-- Example 5: ox_lib Native Trigger
RegisterCommand('notifytest5', function()
    TriggerEvent('ox_lib:notify', {
        title = 'DUYURU',
        description = 'Sunucu bakımı 10 dakika sonra başlayacaktır.',
        caption = 'D3XL ROLEPLAY',
        type = 'announcement',
        duration = 7000
    })
end, false)
