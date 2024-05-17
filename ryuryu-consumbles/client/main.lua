local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent("ryuryu-consumbles:cliant:useitem")
AddEventHandler("ryuryu-consumbles:cliant:useitem", function(RemoveItem, RemoveItemCount)
    if lib.progressBar(Config[RemoveItem].options) then
        TriggerServerEvent("ryuryu-consumbles:server:deleatitem", RemoveItem, RemoveItemCount)
    end
end)


RegisterNetEvent("ryuryu-consumbles:cliant:consumbles")
AddEventHandler("ryuryu-consumbles:cliant:consumbles", function(RemoveItem, RemoveItemCount)
    consumbles = Config[RemoveItem].afteruse
    if consumbles.Add then
        TriggerServerEvent("ryuryu-consumbles:server:additem", consumbles.AddItem, consumbles.AddItemCount)
    end
    if consumbles.Effect.hunger != nil or 0 then
        TriggerServerEvent("consumables:server:addHunger",QBCore.Functions.GetPlayerData().metadata["hunger"] + tonumber(consumbles.Effect.hunger))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end
    if consumbles.Effect.thirst  != nil or 0 then
        TriggerServerEvent("consumables:server:addThirst",QBCore.Functions.GetPlayerData().metadata["thirst"] + tonumber(consumbles.Effect.thirst))
    end
    if consumbles.Effect.Relievestress  != nil or 0 then
        TriggerServerEvent('hud:server:RelieveStress', tonumber(consumbles.Effect.Relievestress))
    end
    if consumbles.Effect.Gainstress  != nil or 0 then
        TriggerServerEvent('hud:server:GainStress', tonumber(consumbles.Effect.Gainstress))
    end
    if consumbles.Effect.armor  != nil or 0 then
        armorAmount = GetPedArmour(PlayerPedId()) + tonumber(consumbles.Effect.armor)
        if armorAmount >= 100 then armorAmount = 100 end
        if armorAmount < 0 then armorAmount = 0 end
        SetPedArmour(PlayerPedId(), armorAmount)
    end
    if consumbles.Effect.hp != nil or 0 then
        local health = GetEntityHealth(PlayerPedId())
        health = (consumbles.Effect.hp * 2) + health
        if health > 200 then health = 200 end
        SetEntityHealth(PlayerPedId(), health + 0.0)
    end
    consumbles.addoneffect()
    lib.notify({
        title = consumbles.notifytitle,
        type = 'success'
    })
end)
