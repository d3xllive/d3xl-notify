-- =================================================================
-- D3XL Notification System - Server Usage Examples
-- Place these snippets inside any server-side script in your server
-- =================================================================

-- Example 1: Send Notification to a Specific Player (targetId)
RegisterCommand('notifyply', function(source, args)
    local targetId = tonumber(args[1]) or source
    exports['d3xl-notify']:SendNotify(targetId, 'YETKİLİ', 'Hesabınıza $50,000 ikramiye tanımlandı!', 'D3XL BANK', 'success', 6000)
end, true)

-- Example 2: Send Notification to ALL Players on the Server (targetId = -1)
RegisterCommand('notifyall', function(source, args)
    local msg = table.concat(args, " ")
    if msg == "" then msg = "Sunucu genel duyurusu!" end
    
    exports['d3xl-notify']:SendNotify(-1, 'DUYURU', msg, 'D3XL SERVER', 'announcement', 8000)
end, true)
