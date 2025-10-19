ESX = exports["es_extended"]:getSharedObject()

local function CanUseCommand(xPlayer)
    if not xPlayer then return false end

    local jobAllowed = Config.AllowedJobs[xPlayer.job.name] or false

    local groupAllowed = false
    if xPlayer.getGroup then
        groupAllowed = Config.AllowedGroups[xPlayer.getGroup()] or false
    end

    return jobAllowed or groupAllowed
end


RegisterCommand(Config.Commands.GiveItem, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if src ~= 0 and not CanUseCommand(xPlayer) then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','You are not allowed to use this command.'} })
    end

    local targetId = tonumber(args[1])
    local item = args[2]
    local amount = tonumber(args[3]) or 1

    if not targetId or not item then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','Usage: /'..Config.Commands.GiveItem..' [id] [item] [amount]'} })
    end

    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if not targetPlayer then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','Player not found.'} })
    end

    if Config.InventoryType == "qs" then
        exports['qs-inventory']:AddItem(targetId, item, amount)
    elseif Config.InventoryType == "ox" then
        TriggerEvent('ox_inventory:addItem', targetId, item, amount)
    end

    TriggerClientEvent('chat:addMessage', src, { args = {'^2SYSTEM',('Gave %s x%d to player [%d]').format(item, amount, targetId)} })
end)


RegisterCommand(Config.Commands.GiveItemAll, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if src ~= 0 and not CanUseCommand(xPlayer) then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','You are not allowed to use this command.'} })
    end

    local item = args[1]
    local amount = tonumber(args[2]) or 1
    if not item then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','Usage: /'..Config.Commands.GiveItemAll..' [item] [amount]'} })
    end

    local xPlayers = ESX.GetExtendedPlayers()
    for _, player in pairs(xPlayers) do
        if Config.InventoryType == "qs" then
            exports['qs-inventory']:AddItem(player.source, item, amount)
        elseif Config.InventoryType == "ox" then
            TriggerEvent('ox_inventory:addItem', player.source, item, amount)
        end
    end

    TriggerClientEvent('chat:addMessage', src, { args = {'^2SYSTEM',('Gave %s x%d to all players.'):format(item, amount)} })
end)


RegisterCommand(Config.Commands.SetAmmo, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if src ~= 0 and not CanUseCommand(xPlayer) then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','You are not allowed to use this command.'} })
    end

    local targetId = tonumber(args[1])
    local ammo = tonumber(args[2]) or 0
    if not targetId or not ammo then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','Usage: /'..Config.Commands.SetAmmo..' [id] [ammo]'} })
    end

    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if not targetPlayer then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','Player not found.'} })
    end

    TriggerClientEvent('setammo:client:setAllAmmo', targetId, ammo)
    TriggerClientEvent('chat:addMessage', src, { args = {'^2SYSTEM',('Set all weapon ammo to %d for player [%d]').format(ammo, targetId)} })
end)


RegisterCommand(Config.Commands.SetAmmoAll, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if src ~= 0 and not CanUseCommand(xPlayer) then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','You are not allowed to use this command.'} })
    end

    local ammo = tonumber(args[1]) or 0
    if not ammo then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','Usage: /'..Config.Commands.SetAmmoAll..' [ammo]'} })
    end

    local xPlayers = ESX.GetExtendedPlayers()
    for _, player in pairs(xPlayers) do
        TriggerClientEvent('setammo:client:setAllAmmo', player.source, ammo)
    end

    TriggerClientEvent('chat:addMessage', src, { args = {'^2SYSTEM',('Set all weapon ammo to %d for all players.'):format(ammo)} })
end)


RegisterCommand(Config.Commands.InfiniteAmmo, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if src ~= 0 and not CanUseCommand(xPlayer) then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','You are not allowed to use this command.'} })
    end

    local targetId = tonumber(args[1]) or src -- toggle for self if no ID
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if not targetPlayer then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','Player not found.'} })
    end

    TriggerClientEvent('infiniteammo:client:toggle', targetId)
end)


RegisterCommand(Config.Commands.InfiniteAmmoAll, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if src ~= 0 and not CanUseCommand(xPlayer) then
        return TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM','You are not allowed to use this command.'} })
    end

    local xPlayers = ESX.GetExtendedPlayers()
    for _, player in pairs(xPlayers) do
        TriggerClientEvent('infiniteammo:client:toggle', player.source)
    end
end)
