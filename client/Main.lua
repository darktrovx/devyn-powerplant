local QBCore = exports["qb-core"]:GetCoreObject()
local FuseBoxes = {}

local function CreateFuseBoxes()
    for station, data in pairs(Config.PowerStations) do
        for k,v in pairs(data.FuseBoxes) do
            local name = "FuseBox"..k
            exports['qb-target']:AddBoxZone(name, v.coords, 0.5, 0.5, {
                name = name,
                heading = v.coords.w,
                debugPoly = false,
                minZ = v.coords.z - 0.1,
                maxZ = v.coords.z + 0.5,
            }, {
                options = {
                    {
                        type = "client",
                        event = "powerplant:thermite",
                        icon = "fas fa-circle",
                        label = "Fusebox",
                        item = "thermite",
                        time = data.time,
                        size = data.size,
                        incorrect = data.incorrect,
                        station = station,
                        box = k,
                    },
                },
                distance = 2.5
            })
            FuseBoxes[#FuseBoxes+1] = name
        end
    end
end

local function RemoveFuseBoxes()
    for i=1, #FuseBoxes do
        exports['qb-target']:RemoveZone(FuseBoxes[i])
    end
end

local function CanThermite(station, box)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("powerplant:CanThermite", function(r)
        p:resolve(r)
    end, station, box)
    return Citizen.Await(p)
end

local function PlantStatus(station)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("powerplant:PlantStatus", function(r)
        p:resolve(r)
    end, station)
    return Citizen.Await(p)
end
exports("PlantStatus", PlantStatus)


CreateThread(function()
    CreateFuseBoxes()
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
    RemoveFuseBoxes()
end)

RegisterNetEvent("powerplant:thermite", function(data)
    if CanThermite(data.station, data.box) then
        exports['ps-ui']:Thermite(function(success)
            if success then
                QBCore.Functions.Notify("The box has been disabled", "success")
                TriggerServerEvent("powerplant:BlowFuseBox", data.station, data.box)
            else
                -- Trigger Police Alert.
            end
        end, data.time, data.size, data.incorrect)
    else
        QBCore.Functions.Notify("This box is disabled", "error")
    end
end)

RegisterNetEvent("powerplant:ParticleEffect", function(coords)
    QBCore.Functions.StartParticleAtCoord("scr_ornate_heist", "scr_heist_ornate_thermal_burn", true, vec3(coords.x, coords.y - 1.0, coords.z), vec3(0.0, 0.0, 180.0), 1.0, false, false, 10000)
end)

RegisterNetEvent("powerplant:Boom", function(station)
    QBCore.Functions.Notify("The wires caught fire! Its about to blow!", "error")
    Wait(15000)
    for k,v in pairs(Config.PowerStations[station]["Explosions"]) do
        AddExplosion(v.x, v.y, v.z, CAR, 1.0, true, false, 2.0)
        Wait(math.random(500, 1000))
    end
    TriggerServerEvent("powerplant:DisablePower", station)
end)