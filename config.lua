Config = {}
Config.Locale = 'pl' -- this sets locale which means that its translation. There are only 'pl' and 'en'

Config.EnableControl = true -- Im not 100% sure if it will override esx_ambulancejob. I'm adding this so in case of something it may help.
Config.ActivateControl = 46 -- this sets button that is responsible for revivivng/healing you. All of the buttons available are here https://docs.fivem.net/docs/game-references/controls/

Config.useMythic = true -- This enables mythic_notify if you want to use it. Dont enable pNotify or else you'll have pNotify instead of mythic_notify
Config.usepNotify = false -- This enables pNotify if you want to use it. You must turn useMythic to true. Or else you'll have mythic_notify

Config.removeMoney = true --this means that it costs money to get healed if your alive ofcourse
Config.Money = 3000 -- this indicates how much money does it cost to get you healed

Config.revivefee = true --if you want other players to pay some more for getting revived turn it on #Warning! it only works with removemoney = true | if you leave it on false then its going to charge what money indicates
Config.reviveMoney = 4500 -- this is how much people will pay if they get revived its not adding to money. I know it says fee but its same as money but when you're dead

Config.EnableFirstPed = true
Config.EnableSecondPed = true
Config.EnableThirdPed = true
Config.EnableFourthPed = true
-- You can add more peds if you want! More Info in howtoaddmorepeds.txt


Config.PedPos = {x = 262.47, y = -1351.43, z = 24.54-1} -- this is coordinates of ped or doctor if you want it that way(I prefer you don't delete -1 on z coord. It spawns ped in air that way)
Config.PedPos2 = {x = 1839.28, y = 3673.07, z = 34.28 -1}
Config.PedPos3 = {x = 308.57, y = -595.36, z = 43.26 -1}
Config.PedPos4 = {x = -249.08, y = 6331.11, z = 32.43 -1}

Config.Zones = {

    EMS = {
        interactcoords = {
            vector3(262.47, -1351.43, 24.54), -- this is where Vdist2 is. If you want you can change it. It should be near ped or same coords with him so you don't get confused
            vector3(308.57, -595.36, 43.26),
            vector3(1839.28, 3673.07, 34.28),
            vector3(-249.08, 6331.11, 32.43),
        },
        textcoords = {
            vector3(262.47, -1351.43, 24.54), -- this is where motiontext is placed. leave it at coords where interractcoords are. Its going to work the best!
            vector3(308.57, -595.36, 43.26),
            vector3(1839.28, 3673.07, 34.28),
            vector3(-249.08, 6331.11, 32.43),
        }
    }
}

Config.usemotiontext = false -- If its on true then you'll need motiontext in your resources! If you leave it on false then its going to use standard text that is inside this script.
Config.distance = 5 -- this is what is indicating how far you have to be to get it working I think its in meters. Idk
Config.textdistance = 50 -- this indicates how far you have to be to not be able to see the text!

Config.ActiveEMS = true -- This is now working! It indicates if doc doesn't work if EMS are active. Below EMSinService you can decide how many EMS are needed for doc to not work
Config.EMSinService = 1 -- This is how many EMS have to be in service for doc not to work
Config.EMSrefreshtime = 30000 -- this function here is responsible for refreshing EMS in service. Its in ms so 1 seconds is 1000ms!

Config.ReviveChance = false -- If its turned on it will count revive chance. I recommend you keep it on false. Otherwise it won't be so great! I'm still working on it
Config.MinimalChance = 0 -- This sets minimal chance of you not getting healed/revived. Better keep it on 0 or the script might get confused
Config.MaximalChance = 100 -- This sets maximal chance of you getting healed/revived. Better keep it above 75 or otherwise 100hp healing will be your friend ;)

Config.repaymistake = false -- this sets if you hit below 75% revive chance you will get reimbursed the cost of healing.
Config.paymistakerevive = 45000 -- this sets how much money you get if after you died you went to doc and he didn't heal you nor revive you
Config.paymistake = 30000 -- this sets how much money you get after doctor didn't heal you 100%

Config.effects = true -- If you want your screen to be drugged then leave it. It will only turn on if you get treated
Config.effectstime = 50000 -- this is how long its going to take for drugs to go away. its 50 seconds now. 1 secods = 1000ms
Config.effectstype = 'type2' -- you have 4 types of drug effects. type1, type2, type3 and type4. If you want non then just leave an empty space. It has a nil value implemented so its not going to crash your server)

Config.restorefood = true -- If its on true then It will add food amount that is typed below
Config.restorefoodamount = 1000000 -- this is how much it adds food to players status 
Config.restorewater = true -- If its on true then It will add water amount that is typed below
Config.restorewateramount = 1000000 -- this is how much it adds water to players status 
