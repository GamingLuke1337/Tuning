Config = {}

Config.Update = 'true' -- Set to false if you dont want to use the update system

Config.NotifySystem = 'ox'  --  'esx', 'ox', 'okok' 'custom'

-- if youre using a custom Notify
Config.CustomNotify = function(source, message)
    TriggerClientEvent('NOTIFY_NAME', source, message) -- Replace NOTIFY_NAME with your notification event
end
