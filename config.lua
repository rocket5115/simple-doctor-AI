Config = {
    removeMoney = true, --this means that it costs money to get healed if your alive ofcourse
    Money = 30000, -- this indicates how much money does it cost to get you healed

    revivefee = true, --if you want other players to pay some more for getting revived turn it on #Warning! it only works with removemoney = true | if you leave it on false then its going to charge what money indicates
    reviveMoney = 45000, -- this is how much people will pay if they get revived its not adding to money. I know it says fee but its same as money but when you're dead

    PedPos = {x = 262.47, y = -1351.43, z = 24.54 -1}, -- this is coordinates of ped or doctor if you want it that way(I prefer you don't delete -1 on z coord. It spawns ped in air that way)
    interactcoords = {x = 262.47, y = -1351.43, z = 24.54}, -- this is where Vdist2 is. If you want you can change it. It should be near ped or same coords with him so you don't get confused
    textcoords = {x = 262.47, y = -1351.43, z = 24.54}, -- this is where motiontext is placed. leave it at coords where interractcoords are. Its going to work the best!

    distance = 5, -- this is what is indicating how far you have to be to get it working I think its in meters. Idk

    ActiveEMS = false, -- Better leave it on false. otherwise get ready for you console to be one big ERROR. I'm still working on it
    EMSinService = 1 -- this is going to be how much EMS have to be in service for doc to not work ^^
}