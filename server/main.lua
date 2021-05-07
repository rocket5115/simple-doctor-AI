ESX = nil

local enough

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('basia:revive') -- its function that is responsible for reviving player. It uses esx_ambulancejob
AddEventHandler('basia:revive', function(target)
    TriggerClientEvent('esx_ambulancejob:revive', source)
end)

RegisterNetEvent('basia:pay') -- its function that is responsible for paying when you are alive
AddEventHandler('basia:pay', function()
    local ped = GetPlayerPed(-1)

    local xPlayer = ESX.GetPlayerFromId(source)

    --TriggerClientEvent('basia:healthcheck')

    if Config.removeMoney then
        xPlayer.removeAccountMoney('bank', Config.Money)
    end
end)

RegisterNetEvent('basia:revivepay') -- its function that is responsible for paying when you are dead
AddEventHandler('basia:revivepay', function()
    local ped = GetPlayerPed(-1)

    local xPlayer = ESX.GetPlayerFromId(source)

    if Config.removeMoney then
        if Config.revivefee then
            xPlayer.removeAccountMoney('bank', Config.reviveMoney)
        else
            xPlayer.removeAccountMoney('bank', Config.Money)
        end
    end
end)

--[[    my playing with Config.EMSinService

RegisterNetEvent('basia:EMScheck')
AddEventHandler('basia:EMScheck', function()
    local _source = source

    local xPlayer  = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()

    local ems = 0

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'ambulance' then
            ems = ems + 1
        end
    end

    if ems >= Config.EMSinService then
        enough = true
    end

    if ems < Config.EMSinService then
        enough = false
    end
end)

--]]

--[[    my playing with Config.EMSinService

Citizen.CreateThread(function()
    while enough do
        Citizen.Wait(10)

        TriggerClientEvent('basia:enough2')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if not enough then 
            TriggerClientEvent('basia:notenough2')
        end
    end
end)

--]]
