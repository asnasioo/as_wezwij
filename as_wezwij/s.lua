ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('wezwij', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])

    if targetId then
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            local wezwanieTekst = "Zostales wezwany przez " .. xPlayer.getName() .. " na kanal pomocy!"
            TriggerClientEvent('as_wezwij:pokazPowiadomienie', targetId, wezwanieTekst, 10)
            local logText = "Administrator " .. xPlayer.getName() .. " wezwał " .. targetPlayer.getName()
            SendToDiscord(logText)

            SendPingToDiscord(discordPingMessage)
        else
            xPlayer.showNotification('Nie znaleziono gracza o ID: ' .. targetId)
        end
    else
        xPlayer.showNotification('Użyj: /wezwij [id]')
    end
end, false)

RegisterCommand('offlinewezwij', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local discordId = args[1]

    if discordId then
        local discordPingMessage = "<@" .. discordId .. "> Zostales wezwany przez " .. xPlayer.getName() .. " na kanal pomocy!"
        SendPingToDiscord(discordPingMessage)
    else
        xPlayer.showNotification('Użyj: /offlinewezwij [discord id]')
    end
end, false)

function SendPingToDiscord(message)
    local webhook = Config.PingWebhook
    if webhook and webhook ~= '' then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

function SendToDiscord(message)
    local webhook = Config.LogsWebhook
    if webhook and webhook ~= '' then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end
