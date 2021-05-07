ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local doc = {
    {type=4, hash=-730659924, x=Config.PedPos.x, y=Config.PedPos.y, z=Config.PedPos.z, a=229.46}, --its hash of our doc
}
    
Citizen.CreateThread(function() -- this thread creates our doctor on cordinates in config.pedpos
    RequestModel(-730659924)
    while not HasModelLoaded(-730659924) do
        Wait(1)
    end
    
    for _, item in pairs(doc) do
        dc = CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, true, true)
        SetBlockingOfNonTemporaryEvents(dc, true)
        SetPedDiesWhenInjured(dc, false)
        SetPedCanPlayAmbientAnims(dc, true)
        SetPedCanRagdollFromPlayerImpact(dc, false)
        SetEntityInvincible(dc, true)
        FreezeEntityPosition(dc, true)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10) -- leave it on 10ms or either cry its using too much resources ;)

        local ped = GetPlayerPed(-1)
        local playerCoord = GetEntityCoords(PlayerPedId(), false)
        local Vector = vector3(Config.interactcoords.x, Config.interactcoords.y, Config.interactcoords.z)
        
        if Vdist2(playerCoord, Vector) < Config.distance then -- this checks distance between you and doc ;)
            if Config.ActiveEMS then -- yeah. Its not really usefull here. its just wasting a bit more space.
                TriggerServerEvent('basia:EMScheck')
                Citizen.Wait(10000)
            end

            if IsControlJustPressed(1, 46) then -- control is just pressed *e* then do the reviving

                FreezeEntityPosition(ped, true)
                SetPedCanRagdollFromPlayerImpact(ped, false)
                SetEntityInvincible(ped, true)

                exports.mythic_notify:DoHudText('inform', 'Doctor is helping you!')

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                exports.mythic_notify:DoHudText('inform', 'Doctor will help you in 15 seconds!')

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                exports.mythic_notify:DoHudText('inform', 'Doctor will help you in 10 seconds!')

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                exports.mythic_notify:DoHudText('inform', 'Doctor will help you in 5 seconds!')

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                Citizen.Wait(1000)

                exports.mythic_notify:DoHudText('inform', 'Doctor helped you!')
                
                --TriggerServerEvent('basia:pay')

                TriggerEvent('basia:statuscheck')
                
                Citizen.Wait(1000) -- this little guy here is giving basia:statuscheck time to really check if guy is dead or not
                if IsPlayerDead(ped) then --It doesn't really seem to do anything. This IsPlayerDead(ped) is because that way it has a chance to check if you are actually dead. I haven't tested it so don't blame me!
                    return
                else
                    TriggerServerEvent('basia:revive', target) --Its trigger that is responsible for reviving player
                end

                Citizen.Wait(1000) -- this give time for revive to actually work without any problems ^^

                SetEntityCoords(ped, playerCoord.x, playerCoord.y, playerCoord.z, false, false, false, false) -- it sets entity(players) coordinates so that we have 100% sure he won't fall through floor!

				Citizen.Wait(1000) -- and this thing just gives a little bit more time so the script can process this request more efficiently

                FreezeEntityPosition(ped, false)
                SetPedCanRagdollFromPlayerImpact(ped, true)
                SetEntityInvincible(ped, false)
            end
        end
    end
end)

Citizen.CreateThread(function() -- here is the motiontext
    while true do
    Citizen.Wait(1)
    exports.motiontext:Draw3DText({
        xyz=Config.textcoords,
        text={
            content="~b~Press ~r~[E] ~b~to seek help from doctor", -- change this text if you want :)
            rgb={255 , 255, 55},
            textOutline=true,
            scaleMultiplier=1,
            font=0
        },
        perspectiveScale=4,
        radius=5000,
    }) 
    end
end)

RegisterNetEvent('basia:statuscheck') -- if you don't know what this thing does it simply just checks if your dead or not. I wanted to do it on server side but it returned health of ped that never existed so I had to stick with client side.
AddEventHandler('basia:statuscheck', function()
    local ped = GetPlayerPed(-1)

    if GetEntityHealth(ped) == 0 then
        TriggerServerEvent('basia:revivepay')
    elseif
        GetEntityHealth(ped) >= 20 then
        TriggerServerEvent('basia:pay')
    end
end)

--[[    my playing with Config.EMSinService

RegisterNetEvent('basia:enough2')
AddEventHandler('basia:enough2', function()
    enough = true
end)

RegisterNetEvent('basia:notenough2')
AddEventHandler('basia:notenough2', function()
    enough = false
end)

--]]

--[[ Its my test with Config.EMSinService! It didn't work :(

Citizen.CreateThread(function()
    while enough do
        local ped = GetPlayerPed(-1)
        local playerCoord = GetEntityCoords(PlayerPedId(), false)
        local Vector = vector3(Config.interactcoords.x, Config.interactcoords.y, Config.interactcoords.z)
            
        if Vdist2(playerCoord, Vector) < Config.distance then
            DisableControlAction(1, 46, true)
        else
            if Vdist2(playerCoord, Vector) < Config.distance then
                DisableControlAction(1, 46, false)
            end
        end
    end
end)

--]]

--[[    my tests with IsPlayerDead
Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)

        Citizen.Wait(10)

        if IsPlayerDead(ped) then
            print("test")
        end

        if GetEntityHealth(ped) == 0 then
            print("asdada")
        end
    end
end)
--]]
