
local C = Config.Commands


Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/'..C.GiveItem, 'Give an item to a specific player', {
        { name = 'id', help = 'Player ID' },
        { name = 'item', help = 'Item name' },
        { name = 'amount', help = 'Amount (default: 1)' }
    })

    TriggerEvent('chat:addSuggestion', '/'..C.GiveItemAll, 'Give an item to all players', {
        { name = 'item', help = 'Item name' },
        { name = 'amount', help = 'Amount (default: 1)' }
    })

    TriggerEvent('chat:addSuggestion', '/'..C.SetAmmo, 'Set all weapons ammo for a specific player', {
        { name = 'id', help = 'Player ID' },
        { name = 'ammo', help = 'Ammo amount' }
    })

    TriggerEvent('chat:addSuggestion', '/'..C.SetAmmoAll, 'Set all weapons ammo for all players', {
        { name = 'ammo', help = 'Ammo amount' }
    })

    TriggerEvent('chat:addSuggestion', '/'..C.InfiniteAmmo, 'Toggle infinite ammo for a specific player', {
        { name = 'id', help = 'Player ID (optional, toggle for yourself if empty)' }
    })

    TriggerEvent('chat:addSuggestion', '/'..C.InfiniteAmmoAll, 'Toggle infinite ammo for all players')
end)


local weaponsList = {
    "weapon_bat","weapon_bottle","weapon_crowbar","weapon_flashlight",
    "weapon_golfclub","weapon_hammer","weapon_knife","weapon_machete",
    "weapon_switchblade","weapon_nightstick","weapon_wrench","weapon_hatchet",
    "weapon_pistol","weapon_pistol_mk2","weapon_combatpistol","weapon_appistol",
    "weapon_stungun","weapon_pistol50","weapon_microsmg","weapon_smg",
    "weapon_assaultsmg","weapon_assaultrifle","weapon_carbinerifle",
    "weapon_advancedrifle","weapon_mg","weapon_combatmg","weapon_pumpshotgun",
    "weapon_sawnoffshotgun","weapon_assaultshotgun","weapon_bullpupshotgun",
    "weapon_sniperrifle","weapon_heavysniper","weapon_marksmanrifle",
    "weapon_heavyshotgun","weapon_specialcarbine","weapon_bullpuprifle",
    "weapon_raycarbine","weapon_raypistol","weapon_rayminigun"
}

local function SetAmmoForWeapon(ped, weaponHash, ammo)
    pcall(function() SetPedAmmo(ped, weaponHash, ammo) end)
    pcall(function() SetAmmoInClip(ped, weaponHash, ammo) end)
end

RegisterNetEvent('setammo:client:setAllAmmo', function(ammo)
    local ped = PlayerPedId()
    if not DoesEntityExist(ped) then return end
    if type(ammo) ~= "number" then return end

    for _, weaponName in ipairs(weaponsList) do
        local weaponHash = GetHashKey(weaponName)
        if HasPedGotWeapon(ped, weaponHash, false) then
            SetAmmoForWeapon(ped, weaponHash, ammo)
        end
    end

    TriggerEvent('chat:addMessage', {
        color = {0,255,0},
        args = {'[SYSTEM]', ('All weapon ammo set to %d'):format(ammo)}
    })
end)


local infiniteAmmoEnabled = false

RegisterNetEvent('infiniteammo:client:toggle', function()
    local ped = PlayerPedId()
    if not DoesEntityExist(ped) then return end

    infiniteAmmoEnabled = not infiniteAmmoEnabled

    SetPedInfiniteAmmo(ped, infiniteAmmoEnabled, true)

    if infiniteAmmoEnabled then
        TriggerEvent('chat:addMessage', {
            color = {0,255,0},
            args = {'[SYSTEM]', 'Infinite ammo ENABLED'}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {255,0,0},
            args = {'[SYSTEM]', 'Infinite ammo DISABLED'}
        })
    end
end)
