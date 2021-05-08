ESX              = nil
local PlayerData = {}

local enough = false

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

RegisterNetEvent('basia:enough')
AddEventHandler('basia:enough', function()
    
    enough = true

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

            if IsControlJustPressed(1, 46) then -- control is just pressed *e* then do the reviving
                if Config.ActiveEMS then
                    if enough then
                        Citizen.Wait(10)
                        exports.mythic_notify:DoHudText('inform', 'Too many EMS!')
                        Citizen.Wait(1000)
                    elseif not enough then
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
                else
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

RegisterNetEvent('basia:set') -- this guy is responsible for setting enough. If 5 EMS are in service and you choose it won't work with 2 in service then this event checks that!
AddEventHandler('basia:set', function(jobs_online)
    jobs = jobs_online

    if jobs['ambulance'] < Config.EMSinService then
        enough = false
    elseif jobs['ambulance'] >= Config.EMSinService then
        enough = true
    end
end)

Citizen.CreateThread(function() -- This thread triggersServerEvent that gets EMS in service!
	while true do
		TriggerServerEvent('basia:get')

		Wait(Config.EMSrefreshtime)
	end
end)
