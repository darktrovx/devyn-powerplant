local QBCore = exports["qb-core"]:GetCoreObject()

local BlownFuses = {}
local Cooldown = {}

local function PlantStatus(station)
    if Cooldown[station] then
        return true
    else
        return false
    end
end

QBCore.Functions.CreateCallback("powerplant:CanThermite", function(source, cb, station, box)
    if not Cooldown[station] and not BlownFuses[station] or not BlownFuses[station][box] then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("powerplant:PlantStatus", function(source, cb, station)
    cb(PlantStatus(station))
end)

RegisterNetEvent("powerplant:BlowFuseBox", function(station, box)
    local src = source
    if BlownFuses[station] == nil then
        BlownFuses[station] = {
            ["completed"] = 0,
            ["boxes"] = {},
        }
    end
    TriggerClientEvent("powerplant:ParticleEffect", -1, Config.PowerStations[station]["FuseBoxes"][box].particles)
    BlownFuses[station]["boxes"][box] = true
    BlownFuses[station]["completed"] = BlownFuses[station]["completed"] + 1
    if BlownFuses[station]["completed"] >= Config.PowerStations[station]["AmountToDisable"] then
        TriggerClientEvent("powerplant:Boom", src, station)
    end
end)

RegisterNetEvent("powerplant:DisablePower", function(station)
    exports['qb-weathersync']:setBlackout(true)
    TriggerClientEvent('chatMessage', -1, "[LS Power]", "error", "City wide power outage, we are working on it!")
    TriggerClientEvent("police:client:DisableAllCameras", -1)
    TriggerClientEvent("powerplant:StationStatus", -1, station, false)
    TriggerEvent("powerplant:StationStatus", station, false)
    Cooldown[station] = true
    Wait(Config.PowerStations[station]["Cooldown"] * 1000)
    Cooldown[station] = false
    BlownFuses[station] = nil
    exports['qb-weathersync']:setBlackout(false)
    TriggerClientEvent('chatMessage', -1, "[LS Power]", "normal", "Power in the city is restored!")
    TriggerClientEvent("police:client:EnableAllCameras", -1)
    TriggerClientEvent("powerplant:StationStatus", -1, station, true)
    TriggerEvent("powerplant:StationStatus", station, true)
end)