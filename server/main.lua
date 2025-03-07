local Vehicles
local Lang = {}

Citizen.CreateThread(function()
    local localeFile = LoadResourceFile(GetCurrentResourceName(), 'locales/' .. (Config.Language or 'en') .. '.lua')

    if localeFile then
        Lang = load(localeFile)()
    else
        print('^1[TuningMenu] No locale found for ' .. Config.Language .. '. Falling back to English.^7')
        Lang = load(LoadResourceFile(GetCurrentResourceName(), 'locales/en.lua'))()
    end
end)

local function _L(key, ...)
    return Lang[key] and string.format(Lang[key], ...) or key
end

local function sendNotification(message, type)
    if Config.Notify == 'esx' then
        TriggerClientEvent('esx:showNotification', source, message)
    elseif Config.Notify == 'ox' then
        TriggerClientEvent('ox_lib:notify', source, { description = message, type = 'error' })
    elseif Config.Notify == 'custom' then
        Config.CustomNotify(source, message)
    elseif Config.Notify == 'okok' then
	TriggerClientEvent('okokNotify:Alert', source, message, type)
    end
end

RegisterServerEvent('tuningmenu:buyMod')
AddEventHandler('tuningmenu:buyMod', function()
    local _source = source
    sendNotification(_source, _L('mod_installed'), 'success')
end)

RegisterCommand("tuning", function(source)
    sendNotification(source, _L('menu_open'), 'info')
    TriggerClientEvent("tuningmenu:open", source)	
end)
