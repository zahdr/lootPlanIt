local _, LPI = ...;

LPI.db = {}
db = LPI.db

function db:init()
    if not LootPlanItDB then
        LootPlanItDB = {}
    end
    
    if not LootPlanItDB.lootCouncil then
        LootPlanItDB.lootCouncil = {}
    end
    
    if not LootPlanItDB.lootCouncil.itemIds then
        LootPlanItDB.lootCouncil.itemIds = {}
    end
end

function db:resetLootCouncilData()
    LootPlanItDB = {}
    LootPlanItDB.lootCouncil = {}
    LootPlanItDB.lootCouncil.itemIds = {}
end

function LPI:importLootCouncilData(data)
    if type(data) == "string" then
        data = LPI:convertStringToTable(data)
    end

    for _, entry in pairs(data) do
        local itemId = entry[1]
        local itemRating = entry[2]
        local itemPrio = entry[3]
        local playerName = entry[4]  
        
        if not LootPlanItDB.lootCouncil.itemIds[itemId] then
            LootPlanItDB.lootCouncil.itemIds[itemId] = {}
        end

        local record = {
            itemRating = itemRating,
            itemPrio = itemPrio,
            playerName = playerName
        }
        
        table.insert(LootPlanItDB.lootCouncil.itemIds[itemId], record)
    end       
    LPI:infoMessage("Loot Council Items imported successfully!")
end


db:init()