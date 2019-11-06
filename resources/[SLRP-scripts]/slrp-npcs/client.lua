local krimped = {
  {type=4, hash=0xe497bbef, x=-61.866802215576, y=-1218.4945068359, z=27.721850891113, a=3374176},
}

local krimpedpos = {
  { ['x'] = -61.866802215576, ['y'] = -1218.4945068359, ['z'] = 27.721850891113 },
}

---------------------------------- Krim Ped ----------------------------------

Citizen.CreateThread(function()

  RequestModel(GetHashKey("s_m_y_dealer_01"))
  while not HasModelLoaded(GetHashKey("s_m_y_dealer_01")) do
    Wait(1)
  end

  RequestAnimDict("mini@strip_club@idles@bouncer@base")
  while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
    Wait(1)
  end

         -- Spawn the NPC
  for _, item in pairs(krimped) do
    krimmainped =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
    SetEntityHeading(krimmainped, 260.0)
    FreezeEntityPosition(krimmainped, true)
    SetEntityInvincible(krimmainped, true)
    SetBlockingOfNonTemporaryEvents(krimmainped, true)
    TaskPlayAnim(krimmainped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

local bagped = {
{type=4, hash=0xe497bbef, x=1100.9234619141, y=-3100.1442871094, z=-39.999950408936, a=3384176},
}

local bagpos = {
{ ['x'] = 1100.9234619141, ['y'] = -3100.1442871094, ['z'] = -39.999950408936 },

}

---------------------------------- Bagmand ped ----------------------------------

Citizen.CreateThread(function()

RequestModel(GetHashKey("s_m_y_dealer_01"))
while not HasModelLoaded(GetHashKey("s_m_y_dealer_01")) do
  Wait(1)
end

RequestAnimDict("mini@strip_club@idles@bouncer@base")
while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
  Wait(1)
end

       -- Spawn the NPC
for _, item in pairs(bagped) do
  bagpeds =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
  SetEntityHeading(bagpeds, 85.0)
  FreezeEntityPosition(bagpeds, true)
  SetEntityInvincible(bagpeds, true)
  SetBlockingOfNonTemporaryEvents(bagpeds, true)
  TaskPlayAnim(bagpeds,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
  end
end)

-------------------- L�GE PED -----------------------------

Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("s_m_m_doctor_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
      Wait(1)
    end

      local hospitalped =  CreatePed(4, 0xd47303ac, 308.492, -596.667, 43.285-0.99, 14.465, false, true)
      local hospitalped2 =  CreatePed(4, 0xd47303ac, 323.931, -582.210, 43.317-0.99, 342.385, false, true)
      SetEntityHeading(hospitalped, 14.465)
      SetEntityHeading(hospitalped2, 342.385)
      FreezeEntityPosition(hospitalped,hospitalped2, true)
      SetEntityInvincible(hospitalped,hospitalped2, true)
      SetBlockingOfNonTemporaryEvents(hospitalped,hospitalped2, true)
end)