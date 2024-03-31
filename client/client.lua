QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('pdepo', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        QBCore.Functions.Notify("Depo 5 saniye sonra açılacak...", "primary", 5000)
        Citizen.Wait(5000)
        TriggerServerEvent('nation-pdcar:policecheck')
    else
        QBCore.Functions.Notify("Bu işlemi yapabilmek için araç içinde olmalısınız!", "error")
    end
end, false)

RegisterNetEvent('nation-pdcar:stashopen', function(citizenid)
    TriggerEvent("inventory:client:SetCurrentStash", "pdaracdepo_".. citizenid)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pdaracdepo_".. citizenid, {
        maxweight = 50000,
        slots = 15
    })
end)
