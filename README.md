

# Events and Exports
CLIENT
```
-- Returns if the plant is disabled currently.
exports["devyn-powerplant"]:PlantStatus(PlantName)

AddEventHandler("powerplant:powerplant:StationStatus", function(station, status)
    -- Your Code here...
end)
```

SERVER
```
-- Returns if the plant is disabled currently.
exports["devyn-powerplant"]:PlantStatus(PlantName)

AddEventHandler("powerplant:powerplant:StationStatus", function(station, status)
    -- Your Code here...
end)
```