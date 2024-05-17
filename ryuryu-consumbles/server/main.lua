local QBCore = exports['qb-core']:GetCoreObject()


for _,v in pairs(Config) do
    QBCore.Functions.CreateUseableItem(v.RemoveItem, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.GetItemByName(item.name) then return end
        TriggerClientEvent("ryuryu-consumbles:cliant:useitem", source, v.RemoveItem, v.RemoveItemCount)
    end)
end



RegisterNetEvent("ryuryu-consumbles:server:deleatitem")
AddEventHandler("ryuryu-consumbles:server:deleatitem", function(RemoveItem, RemoveItemCount)
    if Player.Functions.RemoveItem(RemoveItem, RemoveItemCount) then
        TriggerClientEvent("ryuryu-consumbles:cliant:consumbles", source, RemoveItem)
    end
end)

RegisterNetEvent("ryuryu-consumbles:server:additem")
AddEventHandler("ryuryu-consumbles:server:additem", function(item, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem(item, count)
end)