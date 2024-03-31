QBCore = exports['qb-core']:GetCoreObject()

local function isAllowedJob(playerJob)
    local allowedJobs = {
        ['police'] = true,
        ['state'] = true,
        ['sheriff'] = true,
        ['ranger'] = true,
        ['davison'] = true,
        ['sandys'] = true,
        ['vespucci'] = true,
    }
    return allowedJobs[playerJob] ~= nil
end

RegisterServerEvent('nation-pdcar:policecheck')
AddEventHandler('nation-pdcar:policecheck', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and isAllowedJob(Player.PlayerData.job.name) then
        TriggerClientEvent('nation-pdcar:stashopen', src, Player.PlayerData.citizenid)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Bu komutu kullanma yetkiniz yok!', 'error')
    end
end)
