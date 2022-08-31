
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

Preview:
![image](https://user-images.githubusercontent.com/7463741/187804402-1749d31b-716a-4232-977c-6350d1920392.png)
![image](https://user-images.githubusercontent.com/7463741/187804465-2d5b7b4b-8574-4889-af7a-db0e5f19c714.png)


# Dependencies
https://github.com/Project-Sloth/ps-ui
