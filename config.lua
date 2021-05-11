Config = {
    Locale = 'pl',

    useMythic = true, -- This enables mythic_notify if you want to use it. Dont enable pNotify or else you'll have pNotify instead of mythic_notify
    usepNotify = false, -- This enables pNotify if you want to use it. You must turn useMythic to true. Or else you'll have mythic_notify

    removeMoney = true, --this means that it costs money to get healed if your alive ofcourse
    Money = 30000, -- this indicates how much money does it cost to get you healed

    revivefee = true, --if you want other players to pay some more for getting revived turn it on #Warning! it only works with removemoney = true | if you leave it on false then its going to charge what money indicates
    reviveMoney = 45000, -- this is how much people will pay if they get revived its not adding to money. I know it says fee but its same as money but when you're dead

    PedPos = {x = 262.47, y = -1351.43, z = 24.54 -1}, -- this is coordinates of ped or doctor if you want it that way(I prefer you don't delete -1 on z coord. It spawns ped in air that way)
    interactcoords = {x = 262.47, y = -1351.43, z = 24.54}, -- this is where Vdist2 is. If you want you can change it. It should be near ped or same coords with him so you don't get confused
    textcoords = {x = 262.47, y = -1351.43, z = 24.54}, -- this is where motiontext is placed. leave it at coords where interractcoords are. Its going to work the best!

    distance = 5, -- this is what is indicating how far you have to be to get it working I think its in meters. Idk
    textdistance = 50, -- this indicates how far you have to be to not be able to see the text!

    ActiveEMS = true, -- This is now working! It indicates if doc doesn't work if EMS are active. Below EMSinService you can decide how many EMS are needed for doc to not work
    EMSinService = 2, -- This is how many EMS have to be in service for doc not to work
    EMSrefreshtime = 30000, -- this function here is responsible for refreshing EMS in service. Its in ms so 1 seconds is 1000ms!

    ReviveChance = false, -- If its turned on it will count revive chance. I recommend you keep it on false. Otherwise it won't be so great! I'm still working on it
    MinimalChance = 0, -- This sets minimal chance of you not getting healed/revived. Better keep it on 0 or the script might get confused
    MaximalChance = 100, -- This sets maximal chance of you getting healed/revived. Better keep it above 75 or otherwise 100hp healing will be your friend ;)

    repaymistake = false, -- this sets if you hit below 75% revive chance you will get reimbursed the cost of healing.
    paymistakerevive = 45000, -- this sets how much money you get if after you died you went to doc and he didn't heal you nor revive you
    paymistake = 30000, -- this sets how much money you get after doctor didn't heal you 100%

    effects = true, -- If you want your screen to be drugged then leave it. It will only turn on if you get treated
    effectstime = 50000, -- this is how long its going to take for drugs to go away. its 50 seconds now. 1 secods = 1000ms
    effectstype = '', -- you have 4 types of drug effects. type1, type2, type3 and type4. If you want non then just leave an empty space. It has a nil value implemented so its not going to crash your server)

    restorefood = true,
    restorefoodamount = 1000000,
    restorewater = true,
    restorewateramount = 1000000,
}
