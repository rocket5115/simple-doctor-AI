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
        if not DoesEntityExist(dc) then 
            dc = CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, true, true)
            SetBlockingOfNonTemporaryEvents(dc, true)
            SetPedDiesWhenInjured(dc, false)
            SetPedCanPlayAmbientAnims(dc, true)
            SetPedCanRagdollFromPlayerImpact(dc, false)
            SetEntityInvincible(dc, true)
            FreezeEntityPosition(dc, true)

        else 
            SetEntityAsNoLongerNeeded()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10) 
        if DoesEntityExist(dc) then
            SetEntityAsNoLongerNeeded()
        end
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
                        if Config.useMythic then
                            if Config.usepNotify then
                                exports.pNotify:SendNotification({text = _U('EMS_error'), type = "info", timeout = 2500})
                            else
                                exports.mythic_notify:DoHudText('inform', _U('EMS_error'))
                            end
                        else
                            return
                        end
                        Citizen.Wait(1000)
                    elseif not enough then
                        FreezeEntityPosition(ped, true)
                        SetPedCanRagdollFromPlayerImpact(ped, false)
                        SetEntityInvincible(ped, true)

                        if Config.useMythic then
                            if Config.usepNotify then
                                exports.pNotify:SendNotification({text = _U('start_message'), type = "info", timeout = 2500})
                            else
                                exports.mythic_notify:DoHudText('inform', _U('start_message'))
                            end
                        else
                            return
                        end
                        Citizen.Wait(5000)

                        if Config.useMythic then
                            if Config.usepNotify then
                                exports.pNotify:SendNotification({text = _U('wait_message'), type = "info", timeout = 2500})
                            else
                                exports.mythic_notify:DoHudText('inform', _U('wait_message'))
                            end
                        else
                            return
                        end

                        Citizen.Wait(5000)

                        if Config.useMythic then
                            if Config.usepNotify then
                                exports.pNotify:SendNotification({text = _U('wait_message2'), type = "info", timeout = 2500})
                            else
                                exports.mythic_notify:DoHudText('inform', _U('wait_message2'))
                            end
                        else
                            return
                        end

                        Citizen.Wait(5000)

                        if Config.useMythic then
                            if Config.usepNotify then
                                exports.pNotify:SendNotification({text = _U('wait_message3'), type = "info", timeout = 2500})
                            else
                                exports.mythic_notify:DoHudText('inform', _U('wait_message3'))
                            end
                        else
                            return
                        end

                        Citizen.Wait(5000)

                        if Config.useMythic then
                            if Config.usepNotify then
                                exports.pNotify:SendNotification({text = _U('success_message'), type = "info", timeout = 2500})
                            else
                                exports.mythic_notify:DoHudText('inform', _U('success_message'))
                            end
                        else
                            return
                        end

                        TriggerEvent('basia:statuscheck')

                        Citizen.Wait(1000) -- this little guy here is giving basia:statuscheck time to really check if guy is dead or not
                        if IsPlayerDead(ped) then --It doesn't really seem to do anything. This IsPlayerDead(ped) is because that way it has a chance to check if you are actually dead. I haven't tested it so don't blame me!
                            return
                        else
                            TriggerServerEvent('basia:revive', target) --Its trigger that is responsible for reviving player
                        end

                        if Config.effects then
                            if Config.effectstype == 'type1' then
    
                                TriggerEvent('basia:effects')

                                FreezeEntityPosition(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, true)
                                SetEntityInvincible(ped, false)

    
                            elseif Config.effectstype == 'type2' then
    
                                TriggerEvent('basia:effects2')
    
                                FreezeEntityPosition(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, true)
                                SetEntityInvincible(ped, false)

                            elseif Config.effectstype == 'type3' then
    
                                TriggerEvent('basia:effects3')
                                
                                FreezeEntityPosition(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, true)
                                SetEntityInvincible(ped, false)

                            elseif Config.effectstype == 'type4' then
    
                                TriggerEvent('basia:effects4')
    
                                FreezeEntityPosition(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, true)
                                SetEntityInvincible(ped, false)

                            elseif Config.effectstype == nil then

                                if Config.useMythic then
                                    if Config.usepNotify then
                                        exports.pNotify:SendNotification({text = "no other symptoms", type = "info", timeout = 2500})
                                    else
                                        exports.mythic_notify:DoHudText('inform', "no other symptoms")
                                    end
                                else
                                    return
                                end
                                
                                FreezeEntityPosition(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, true)
                                SetEntityInvincible(ped, false)

                                Citizen.Wait(10)
                            end
                        else
                            FreezeEntityPosition(ped, false)
                            SetPedCanRagdollFromPlayerImpact(ped, true)
                            SetEntityInvincible(ped, false)
                        end

                        Citizen.Wait(1000) -- this give time for revive to actually work without any problems ^^

                        SetEntityCoords(ped, playerCoord.x, playerCoord.y, playerCoord.z, false, false, false, false) -- it sets entity(players) coordinates so that we have 100% sure he won't fall through floor!

                        FreezeEntityPosition(ped, false)
                        SetPedCanRagdollFromPlayerImpact(ped, true)
                        SetEntityInvincible(ped, false)

                        Citizen.Wait(1000) -- and this thing just gives a little bit more time so the script can process this request more efficiently

                    end
                else
                    FreezeEntityPosition(ped, true)
                    SetPedCanRagdollFromPlayerImpact(ped, false)
                    SetEntityInvincible(ped, true)

                    if Config.useMythic then
                        if Config.usepNotify then
                            exports.pNotify:SendNotification({text = _U('start_message'), type = "info", timeout = 2500})
                        else
                            exports.mythic_notify:DoHudText('inform', _U('start_message'))
                        end
                    else
                        return
                    end
                    Citizen.Wait(5000)

                    if Config.useMythic then
                        if Config.usepNotify then
                            exports.pNotify:SendNotification({text = _U('wait_message'), type = "info", timeout = 2500})
                        else
                            exports.mythic_notify:DoHudText('inform', _U('wait_message'))
                        end
                    else
                        return
                    end

                    Citizen.Wait(5000)

                    if Config.useMythic then
                        if Config.usepNotify then
                            exports.pNotify:SendNotification({text = _U('wait_message2'), type = "info", timeout = 2500})
                        else
                            exports.mythic_notify:DoHudText('inform', _U('wait_message2'))
                        end
                    else
                        return
                    end

                    Citizen.Wait(5000)

                    if Config.useMythic then
                        if Config.usepNotify then
                            exports.pNotify:SendNotification({text = _U('wait_message3'), type = "info", timeout = 2500})
                        else
                            exports.mythic_notify:DoHudText('inform', _U('wait_message3'))
                        end
                    else
                        return
                    end

                    Citizen.Wait(5000)

                    if Config.useMythic then
                        if Config.usepNotify then
                            exports.pNotify:SendNotification({text = _U('success_message'), type = "info", timeout = 2500})
                        else
                            exports.mythic_notify:DoHudText('inform', _U('success_message'))
                        end
                    else
                        return
                    end

                    TriggerEvent('basia:statuscheck')
                    
                    Citizen.Wait(1000) -- this little guy here is giving basia:statuscheck time to really check if guy is dead or not
                    if IsPlayerDead(ped) then --It doesn't really seem to do anything. This IsPlayerDead(ped) is because that way it has a chance to check if you are actually dead. I haven't tested it so don't blame me!
                        return
                    else
                        TriggerServerEvent('basia:revive', target) --Its trigger that is responsible for reviving player
                    end

                    if Config.effects then
                        if Config.effectstype == 'type1' then

                            TriggerEvent('basia:effects')

                            FreezeEntityPosition(ped, false)
                            SetPedCanRagdollFromPlayerImpact(ped, true)
                            SetEntityInvincible(ped, false)


                        elseif Config.effectstype == 'type2' then

                            TriggerEvent('basia:effects2')

                            FreezeEntityPosition(ped, false)
                            SetPedCanRagdollFromPlayerImpact(ped, true)
                            SetEntityInvincible(ped, false)

                        elseif Config.effectstype == 'type3' then

                            TriggerEvent('basia:effects3')
                            
                            FreezeEntityPosition(ped, false)
                            SetPedCanRagdollFromPlayerImpact(ped, true)
                            SetEntityInvincible(ped, false)

                        elseif Config.effectstype == 'type4' then

                            TriggerEvent('basia:effects4')

                            FreezeEntityPosition(ped, false)
                            SetPedCanRagdollFromPlayerImpact(ped, true)
                            SetEntityInvincible(ped, false)

                        elseif Config.effectstype == nil then

                            if Config.useMythic then
                                if Config.usepNotify then
                                    exports.pNotify:SendNotification({text = "no other symptoms", type = "info", timeout = 2500})
                                else
                                    exports.mythic_notify:DoHudText('inform', "no other symptoms")
                                end
                            else
                                return
                            end
                            
                            FreezeEntityPosition(ped, false)
                            SetPedCanRagdollFromPlayerImpact(ped, true)
                            SetEntityInvincible(ped, false)

                            Citizen.Wait(10)
                        end
                    else
                        FreezeEntityPosition(ped, false)
                        SetPedCanRagdollFromPlayerImpact(ped, true)
                        SetEntityInvincible(ped, false)
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
            content=_U('text_content'), -- change this text if you want :)
            rgb={255 , 255, 55},
            textOutline=true,
            scaleMultiplier=1,
            font=0
        },
        perspectiveScale=4,
        radius=Config.textdistance,
    }) 
    end
end)

RegisterNetEvent('basia:statuscheck') -- if you don't know what this thing does it simply just checks if your dead or not. I wanted to do it on server side but it returned health of ped that never existed so I had to stick with client side.
AddEventHandler('basia:statuscheck', function()
    local ped = GetPlayerPed(-1)

    if GetEntityHealth(ped) == 0 then
        TriggerServerEvent('basia:revivepay')
    elseif GetEntityHealth(ped) >= 20 then
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

RegisterNetEvent('basia:revivechance')
AddEventHandler('basia:revivechance', function()
    local ped = GetPlayerPed(-1)

    revivechance()

    Citizen.Wait(10)

    if revivechance() == 0 then
        if GetEntityHealth(ped) == 0 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 0)
            Citizen.Wait(10)
            if Config.removeMoney then
                if Config.revivefee then
                    if Config.repaymistake then
                        TriggerServerEvent('basia:paymistakerevive')
                    else
                        TriggerEvent('basia:inform')
                    end
                    TriggerServerEvent('basia:paymistakerevive')
                else
                    TriggerServerEvent('basia:paymistake')
                end
            else
                return
            end
            exports.mythic_notify:DoHudText('inform', 'Doctor made mistake and you wont be charged!')
        elseif GetEntityHealth(ped) >= 20 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 100)
            Citizen.Wait(10)
            if Config.removeMoney then
                if Config.repaymistake then
                    TriggerServerEvent('basia:paymistake')
                else
                    TriggerEvent('basia:inform')
                end
            else
                return
            end
            exports.mythic_notify:DoHudText('inform', 'Doctor made mistake and you wont be charged!')
        elseif GetEntityHealth(ped) >= 100 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 100)
            Citizen.Wait(10)
            if Config.removeMoney then
                if Config.repaymistake then
                    TriggerServerEvent('basia:paymistake')
                else
                    TriggerEvent('basia:inform')
                end
            else
                return
            end
            if Config.useMythic then
                if Config.usepNotify then
                    exports.pNotify:SendNotification({text = "Doctor made mistake and you wont be charged!", type = "info", timeout = 2500})
                else
                    exports.mythic_notify:DoHudText('inform', 'Doctor made mistake and you wont be charged!')
                end
            else
                return
            end
        end
    elseif revivechance() >= 50 then
        if GetEntityHealth(ped) == 0 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 100)
            Citizen.Wait(10)
            if Config.removeMoney then
                if Config.revivefee then
                    if Config.repaymistake then
                        TriggerServerEvent('basia:paymistakerevive')
                    else
                        TriggerEvent('basia:inform')
                    end
                else
                    return
                end
            else
                return
            end
            if Config.useMythic then
                if Config.usepNotify then
                    exports.pNotify:SendNotification({text = "Doctor made mistake and you wont be charged!", type = "info", timeout = 2500})
                else
                    exports.mythic_notify:DoHudText('inform', 'Doctor made mistake and you wont be charged!')
                end
            else
                return
            end
        elseif GetEntityHealth(ped) >= 20 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 150)
            Citizen.Wait(10)
            if Config.removeMoney then
                if Config.repaymistake then
                    TriggerServerEvent('basia:paymistake')
                else
                    TriggerEvent('basia:inform')
                end
            else
                return
            end
            if Config.useMythic then
                if Config.usepNotify then
                    exports.pNotify:SendNotification({text = "Doctor made mistake and you wont be charged!", type = "info", timeout = 2500})
                else
                    exports.mythic_notify:DoHudText('inform', 'Doctor made mistake and you wont be charged!')
                end
            else
                return
            end
        elseif GetEntityHealth(ped) >= 100 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 150)
            Citizen.Wait(10)
            if Config.removeMoney then
                if Config.repaymistake then
                    TriggerServerEvent('basia:paymistake')
                else
                    TriggerEvent('basia:inform')
                end
            else
                return
            end
            if Config.useMythic then
                if Config.usepNotify then
                    exports.pNotify:SendNotification({text = "Doctor made mistake and you wont be charged so much!", type = "info", timeout = 2500})
                else
                    exports.mythic_notify:DoHudText('inform', 'Doctor made mistake and you wont be charged so much!')
                end
            else
                return
            end
        end
    elseif revivechance() >= 75 then
        if GetEntityHealth(ped) == 0 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 200)
            Citizen.Wait(10)
            if Config.useMythic then
                if Config.usepNotify then
                    exports.pNotify:SendNotification({text = "Doctor Healed you so you get to live another day!", type = "info", timeout = 2500})
                else
                    exports.mythic_notify:DoHudText('inform', 'Doctor Healed you so you get to live another day!')
                end
            else
                return
            end
        elseif GetEntityHealth(ped) >= 20 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 200)
            Citizen.Wait(10)
            if Config.useMythic then
                if Config.usepNotify then
                    exports.pNotify:SendNotification({text = "Doctor Healed you so you get to live another day!", type = "info", timeout = 2500})
                else
                    exports.mythic_notify:DoHudText('inform', 'Doctor Healed you so you get to live another day!')
                end
            else
                return
            end
        elseif GetEntityHealth(ped) >= 100 then
            Citizen.Wait(1000)
            SetEntityHealth(ped, 200)
            Citizen.Wait(10)
            if Config.useMythic then
                if Config.usepNotify then
                    exports.pNotify:SendNotification({text = "Doctor Healed you so you get to live another day!", type = "info", timeout = 2500})
                else
                    exports.mythic_notify:DoHudText('inform', 'Doctor Healed you so you get to live another day!')
                end
            else
                return
            end
        end
    end
end)

function revivechance()
    return math.random(Config.MinimalChance, Config.MaximalChance)
end

RegisterNetEvent('basia:inform')
AddEventHandler('basia:inform', function()
    exports.mythic_notify:DoHudText('inform', 'Hospital said they do not confess to doctor mistake. Guess you are going bankrupt')
end)

RegisterNetEvent('basia:effects')
AddEventHandler('basia:effects', function()
    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
    
    RequestAnimSet("MOVE_M@QUICK") 
    while not HasAnimSetLoaded("MOVE_M@QUICK") do
        Citizen.Wait(10)
    end    

    Citizen.Wait(300)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "MOVE_M@QUICK", true)
    SetPedIsDrunk(playerPed, true)
    AnimpostfxPlay("DrugsMichaelAliensFight", 50001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    Citizen.Wait(Config.effectstime)
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)

    Normal()
end)

RegisterNetEvent('basia:effects2')
AddEventHandler('basia:effects2', function()
    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
  
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
      Citizen.Wait(0)
    end    
    
    Citizen.Wait(300)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator6")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(playerPed, true)
    AnimpostfxPlay("ChopVision", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)
	
    Citizen.Wait(Config.effectstime)
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('basia:effects3')
AddEventHandler('basia:effects3', function()
    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
  
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
      Citizen.Wait(0)
    end    
    
    Citizen.Wait(300)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator6")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(playerPed, true)
    AnimpostfxPlay("ChopVision", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)
	
    Citizen.Wait(Config.effectstime)
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('basia:effects4')
AddEventHandler('basia:effects4', function()
    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@hobo@a") 
    while not HasAnimSetLoaded("move_m@hobo@a") do
      Citizen.Wait(0)
    end    

    Citizen.Wait(300)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator3")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hobo@a", true)
    SetPedIsDrunk(playerPed, true)
    AnimpostfxPlay("HeistCelebPass", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)

    Citizen.Wait(Config.effectstime)
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

function Normal()

    Citizen.CreateThread(function()
        local playerPed = GetPlayerPed(-1)
                
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        ResetPedMovementClipset(playerPed, 0) 
        SetPedIsDrunk(playerPed, false)
        SetPedMotionBlur(playerPed, false)
        SetPedMoveRateOverride(PlayerId(),1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
        SetPedIsDrunk(GetPlayerPed(-1), false)		
        SetPedMotionBlur(playerPed, false)
        ResetPedMovementClipset(GetPlayerPed(-1))
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
    end)
end
