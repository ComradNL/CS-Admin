Config = {}

-- Allowed jobs (ESX job names)
Config.AllowedJobs = {
    ["admin"] = true,
    ["police"] = true,
    ["boss"] = true
}

-- Allowed groups (ESX group names or your server role system)
Config.AllowedGroups = {
    ["superadmin"] = true,
    ["mod"] = false
}

-- Inventory type: "qs" = Quasar, "ox" = OX Inventory
Config.InventoryType = "qs"

-- Command names (configurable)
Config.Commands = {
    GiveItem = "giveitem",
    GiveItemAll = "giveitemall",
    SetAmmo = "setammo",
    SetAmmoAll = "setammoall",
    InfiniteAmmo = "infiniteammo",
    InfiniteAmmoAll = "infiniteammoall"
}
