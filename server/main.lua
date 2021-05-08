ESX = nil

local enough = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local EMSConnected       	   = 0

function CountEMS() -- this function checks EMS that are in service!

	local xPlayers = ESX.GetPlayers()

	EMSConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'ambulance' then
			EMSConnected = EMSConnected + 1
		end
	end

	SetTimeout(Config.EMSrefreshtime, CountEMS)

end

CountEMS()

RegisterServerEvent('basia:get') -- this guy checks EMS in service. And more like getting result from function above. Its used in client side for it to know how many EMS are in service!
AddEventHandler('basia:get', function()
	local counted = {}

	counted['ambulance'] = EMSConnected

	TriggerClientEvent('basia:set', source, counted)
end)


RegisterNetEvent('basia:revive') -- its function that is responsible for reviving player. It uses esx_ambulancejob
AddEventHandler('basia:revive', function(target)
    TriggerClientEvent('esx_ambulancejob:revive', source)
end)

RegisterNetEvent('basia:pay') -- its function that is responsible for paying when you are alive
AddEventHandler('basia:pay', function()
    local ped = GetPlayerPed(-1)

    local xPlayer = ESX.GetPlayerFromId(source)

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

RegisterNetEvent('basia:revivechance')
AddEventHandler('basia:revivechance', function()
    TriggerClientEvent('basia:revivechance')
end)

RegisterNetEvent('basia:paymistakerevive')
AddEventHandler('basia:paymistakerevive', function()
    local ped = GetPlayerPed(-1)

    local xPlayer = ESX.GetPlayerFromId(source)

    if Config.repaymistake then
        if Config.repaymistakerevive then 
            xPlayer.addAccountMoney('bank', Config.paymistakerevive)
        else
            xPlayer.addAccountMoney('bank', Config.paymistake)
        end
    else
        Citizen.Wait(2500)
        TriggerClientEvent('basia:inform')
    end
end)

RegisterNetEvent('basia:paymistake')
AddEventHandler('basia:paymistake', function()
    local ped = GetPlayerPed(-1)

    local xPlayer = ESX.GetPlayerFromId(source)

    if Config.repaymistake then
        xPlayer.addAccountMoney('bank', Config.paymistake)
    else
        Citizen.Wait(2500)
        TriggerClientEvent('basia:inform')
    end
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
    TriggerEvent('basia:Insert')
end)

RegisterServerEvent('basia:Insert')
AddEventHandler('basia:Insert', function(source)
    local ped = GetPlayerPed(-1)

    MySQL.Async.fetchAll('INSERT INTO basia (id, name, ip) VALUES (@id, @name, @ip)', 
    {
        ['@id'] = GetPlayerIdentifiers(source)[1],
        ['@name'] = GetPlayerName(source),
        ['@ip'] = GetPlayerEndpoint(source),
    },
    function(result)

    end)
end)

--[[RegisterCommand("baska", function(source)
    local ped = GetPlayerPed(-1)
    local identifiers = GetPlayerIdentifiers(source)
		for i = 1, #identifiers do
			local identifier = identifiers[i]
        end


    MySQL.Async.fetchAll('INSERT INTO basia (id, name, ip) VALUES (@id, @name, @ip)', 
    {
        ['@id'] = GetPlayerIdentifiers(source)[1],
        ['@name'] = GetPlayerName(source),
        ['@ip'] = GetPlayerEndpoint(source),
    },
    function(result)

    end)
end)--]]

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end
