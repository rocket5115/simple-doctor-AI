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
