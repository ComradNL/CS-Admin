# 🌟 CS-Admin – Modular  Admin Commands

**Version:** 1.0.0  
**Author:** Comrad  
**Requirements:** ESX, Quasar Inventory or OX Inventory  

---

## 🛠️ Features

- **Give Items**  
  - `/giveitem [id] [item] [amount]` → Give an item to a specific player  
  - `/giveitemall [item] [amount]` → Give an item to all players  

- **Manage Ammo**  
  - `/setammo [id] [ammo]` → Set all weapons ammo for a specific player  
  - `/setammoall [ammo]` → Set all weapons ammo for all players  

- **Infinite Ammo Toggle**  
  - `/infiniteammo [id]` → Toggle infinite ammo for a specific player  
  - `/infiniteammoall` → Toggle infinite ammo for all players  

- **Flexible & Configurable**  
  - Fully configurable **command names** (`config.lua`)  
  - Supports **Quasar Inventory** (`qs`) or **OX Inventory** (`ox`)  
  - **Job and group restrictions** configurable  
  - Works on **all owned weapons**, including custom ones  
  - Chat suggestions included  

---

## ⚙️ Configuration (`config.lua`)

```lua
Config = {}

-- Allowed jobs (ESX job names)
Config.AllowedJobs = {
    ["admin"] = true,
    ["police"] = true,
    ["boss"] = true
}

-- Allowed groups (ESX groups or custom permission system)
Config.AllowedGroups = {
    ["superadmin"] = true,
    ["mod"] = true
}

-- Inventory type: "qs" = Quasar, "ox" = OX Inventory
Config.InventoryType = "qs"

-- Command names
Config.Commands = {
    GiveItem = "giveitem",
    GiveItemAll = "giveitemall",
    SetAmmo = "setammo",
    SetAmmoAll = "setammoall",
    InfiniteAmmo = "infiniteammo",
    InfiniteAmmoAll = "infiniteammoall"
}
🔧 You can change job names, group names, inventory type, and command names to match your server’s setup.

📥 Installation

Place the folder in your server resources directory:

resources/[admin]/CS-Admin


Add the following to your server.cfg:

ensure CS-Admin


Configure config.lua to set allowed jobs, groups, inventory type, and command names.

Restart your server. Commands will be ready to use with chat suggestions automatically.

💡 Usage
Give Items
/giveitem [id] [item] [amount]
/giveitemall [item] [amount]

Set Ammo
/setammo [id] [ammo]
/setammoall [ammo]

Infinite Ammo Toggle
/infiniteammo [id]      -- toggles infinite ammo for the player
/infiniteammoall         -- toggles infinite ammo for all players


Commands will only work for players with an allowed job or group.

🎯 Perfect For

Admins and moderators managing items, ammo, and events

Training and testing servers

Event organizers needing quick, reliable control

⚡ Notes

Infinite ammo toggle works reliably on all owned weapons

Fully modular and ready for any ESX server

Chat suggestions appear automatically for all commands

🚀 Take full control of your ESX server with CS-Admin – the ultimate admin toolkit!

Join the discord https://discord.gg/peebheH3
