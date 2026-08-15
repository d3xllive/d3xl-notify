-- =================================================================
-- D3XL FiveM Standalone Notification Server Script
-- Author: d3xl
-- =================================================================

-- Server Function to trigger notification on client
function SendNotify(targetId, title, message, subtext, type, duration)
    if not targetId or targetId == -1 then
        TriggerClientEvent('d3xl-notify:send', -1, title, message, subtext, type, duration)
    else
        TriggerClientEvent('d3xl-notify:send', targetId, title, message, subtext, type, duration)
    end
end

exports('SendNotify', SendNotify)

RegisterNetEvent('d3xl-notify:server:send', function(targetId, title, message, subtext, type, duration)
    SendNotify(targetId, title, message, subtext, type, duration)
end)
