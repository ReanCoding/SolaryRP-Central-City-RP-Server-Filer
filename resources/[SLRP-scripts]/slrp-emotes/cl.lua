--Se flere anims her https://pastebin.com/6mrYTdQv
local emotes = {
    -- Ryg en smøg
    ['ryg'] = "ryg",
    -- ['smoke'] = "WORLD_HUMAN_SMOKING",
    -- Giv penge emoten, bruges til f.eks at høste tomater.
    -- ['penge'] = "PROP_HUMAN_PARKING_METER",
    ['høst'] = "PROP_HUMAN_PARKING_METER",
    -- Læn dig op ad ting
    --['lean'] = "WORLD_HUMAN_LEANING",
    -- Armbøjninger
    --['armbøjninger'] = "WORLD_HUMAN_PUSH_UPS",
    ['læn'] = "WORLD_HUMAN_LEANING",
    -- Sid ned på en stol
    ['sid'] = "PROP_HUMAN_SEAT_BENCH",
    -- Stå med mobil
    -- ['phone'] = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT",
    ['mobil'] = "phone",
	['sidned'] = "WORLD_HUMAN_PICNIC",
    -- Plant
    ['plant'] = "WORLD_HUMAN_GARDENER_PLANT",
    -- Grill?
    ['bbq'] = "PROP_HUMAN_BBQ",
    -- Bor
    ['bor'] = "WORLD_HUMAN_CONST_DRILL",
    -- stille dans
    ['stilledans'] = "WORLD_HUMAN_STRIP_WATCH_STAND",
    -- Øl
    ['øl'] = "WORLD_HUMAN_PARTYING",
    -- Drik
    ['drik'] = "WORLD_HUMAN_DRINKING",
    -- Fisk
    ['fisk'] = "WORLD_HUMAN_STAND_FISHING",
    -- Flex muskler
    ['flex'] = "WORLD_HUMAN_MUSCLE_FLEX",
    -- Hammer
    ['hammer'] = "WORLD_HUMAN_HAMMERING",
    -- Hep & Klap
    ['hep'] = "WORLD_HUMAN_CHEERING",
    -- Kamera
    --['kamera'] = "WORLD_HUMAN_PAPARAZZI",
    -- kikkert
    --['kikkert'] = "kikkert",
    -- Lig på maven
    ['ligpåmaven'] = "ligpåmaven",
    -- Lig på ryggen
    --['ligpåryggen'] = "WORLD_HUMAN_SUNBATHE_BACK",
    -- Lig på siden
    ['ligpåsiden'] = "WORLD_HUMAN_BUM_SLUMPED",
    -- Lommelygte
    --['lommelygte'] = "WORLD_HUMAN_SECURITY_SHINE_TORCH",
    -- Løb
    ['løb'] = "WORLD_HUMAN_JOG_STANDING",
    -- Vægt
    ['træn'] = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
    -- Mavebøjninger
    --['mavebøjninger'] = "WORLD_HUMAN_SIT_UPS",
    -- Notesblok
    ['notesblok'] = "notesblok",
    -- Optag med mobil
    ['optag'] = "optag",
    -- joint
    ['rygjoint'] = "rygjoint",
    -- Sid på knæ
    ['knæ'] = "knæ",
    -- Spil musik
    ['musik'] = "WORLD_HUMAN_MUSICIAN",
    -- Trafik
    -- ['trafik'] = "WORLD_HUMAN_CAR_PARK_ATTENDANT",
    -- kost
    --['kost'] = "WORLD_HUMAN_JANITOR",
    -- Stå som politi
    ['politi'] = "WORLD_HUMAN_COP_IDLES",
    -- Stå som vagt
    ['vagt'] = "WORLD_HUMAN_GUARD_STAND",
    -- Stå som statue
    ['statue'] = "statue",
    -- Tigger
    -- ['tigger'] = "WORLD_HUMAN_BUM_FREEWAY",
    -- Turistkort
    ['kort'] = "WORLD_HUMAN_TOURIST_MAP",
    -- Undersøg
    --  ['undersøg'] = "CODE_HUMAN_POLICE_INVESTIGATE",
    -- Utålmodig
    ['utålmodig'] = "WORLD_HUMAN_STAND_IMPATIENT",
    -- Vask vinduer
    -- ['vask'] = "WORLD_HUMAN_BUM_WASH",
    -- Dyrk yoga
    ['yoga'] = "WORLD_HUMAN_YOGA",
    ['læn2'] = "læn2",
    ['luder'] = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS",
    ['luder2'] = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS",
    ['vaskvindue'] = "WORLD_HUMAN_MAID_CLEAN",
    ['tjekperson'] = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
    ['træn2'] = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON",
    ['damn'] = "damn",
    ['kaffe'] = "kaffe",
    ['kys'] = "kys",
    ['mic'] = "mic",
    ['cam'] = "cam",
    ['mic2'] = "mic2",
    ['gangsterdans'] = "gangsterdans",
    ['syredans'] = "syredans",
    ['udklipsholder'] = "udklipsholder",
    ['bladblæser'] = "bladblæser",
    ['krydsarme'] = "krydsarme",
    ['dobbeltfuck'] = "dobbeltfuck",
    ['facepalm'] = "facepalm",
    ['pilnæse'] = "pilnæse",
    ['skør'] = "skør",
    ['dans'] = "dans",
    ['suicide'] = "suicide",
    ['armbøjninger'] = "armbøjninger",
    ['kamera'] = "kamera",
    ['mavebøjninger'] = "mavebøjninger",
    ['rygjoint'] = "rygjoint",
    ['vask'] = "vasktest",
    ['tigger'] = "tigger",
    ['trafik'] = "trafik",
    ['dj'] = "dj",
    ['fingerknep'] = "fingerknep",
    ['skråtop'] = "skråtop",
    ['rage'] = "rage",
    ['knækfingre'] = "knækfingre",
    ['peace'] = "peace",
    ['dollyno'] = "dollyno",
    ['salute'] = "salute",
    ['tys'] = "tys",
    ['thumbsup'] = "thumbsup",
    ['drillepind'] = "drillepind",
    ['wank'] = "wank",
    ['brolove'] = "brolove",
    ['ligpåryggen'] = "ligpåryggen",
    ['frygt'] = "frygt",
    --['repairtest'] = "repairtest",
    ['picnic'] = "picnic",
	['sidtest'] = "sidtest",




}

local moods = {

    -- Normal
    ['normal'] = "mood_normal_1",
    -- Glad
    ['glad'] = "mood_happy_1",
    -- Sur
    ['sur'] = "mood_drivefast_1",
    -- Sover
    ['sover'] = "mood_sleeping_1",
    -- Bekymret
    ['bekymret'] = "mood_injured_1",
    -- Fuld
    ['fuld'] = "mood_drunk_1",
    -- Ked af det
    ['ked'] = "mood_sulk_1",
    -- Smerte
    ['smerte'] = "pain_5",

}

RegisterNetEvent("emote:start")
RegisterNetEvent("emote:display")
RegisterNetEvent("emote:dog")
RegisterNetEvent("emote:mood")


RegisterNetEvent('ftn:mobil') -- Tag mobilen frem
AddEventHandler('ftn:mobil', function()
    delProps()
    Wait(1)
    Phone()
end)
RegisterNetEvent('ftn:mobil2') -- Tag mobilen op til øret
AddEventHandler('ftn:mobil2', function()
    delProps()
    Wait(1)
    PhoneEar()

end)
RegisterNetEvent('ftn:mobil3') -- Fjern mobilen fra person - Tilføjet til de andre for at undgå at telefonen gennemborer hånden.
AddEventHandler('ftn:mobil3', function()
    delProps()
end)
RegisterNetEvent('ftn:repair') -- Repair emoten til mekanikere
AddEventHandler('ftn:repair', function()

    Repair()

end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function displayEmotes()
    local index = 0
    local display = "^7"

    for name, value in pairs(emotes) do
        index = index + 1
        if index == 1 then
            display = display..name
        else
            display = display..", "..name
        end
    end

    TriggerEvent("chatMessage", "EMOTES", {255,0,0}, "")
    TriggerEvent("chatMessage", "", {255,255,255}, "armbøjninger - brolove - bbq - bladblæser - bor - damn - dans - dj - drillepind - dobbeltfuck - drik - facepalm - fingerknep - frygt - fisk - flex - gangsterdans - hammer - hep - høst - kaffe - kamera - knæ - kort - kost - krydsarme - knækfingre - kys - ligpåmaven - ligpåryggen - ligpåsiden - luder - luder2 - læn - læn2 - løb - mavebøjninger - mobil - musik - notesblok - optag - pilnæse - plant - peace - politi - rage - ryg - rygjoint - skråtop - skør - sid - salute - statue - suicide - syredans - stilledans - tigger - tjekperson - trafik - tys - thumbsup - træn - træn2 - udklipsholder - vagt - vask - vaskvindue - wank - yoga - øl")
end

Citizen.CreateThread(function()
    local index = 0
    local display = ""
    for name, value in pairs(emotes) do
        index = index + 1
        if index == 1 then
            display = display..name
        else
            display = display..", "..name
        end
    end
    --TriggerEvent('chat:addSuggestion', '/e', display)
    TriggerEvent('chat:addSuggestion', '/pis eller /tis', 'Skal bruges når du skal pisse, ellers pisser du i bukserne!')
    TriggerEvent('chat:addSuggestion', '/me eller /mig', 'Denne funktion bruges til at skrive f.eks en tanke. (/mig Tænker: Nøj jeg kunne godt en pizza.)')
    TriggerEvent('chat:addSuggestion', '/rapporterfejl', 'Denne funktion bruges til at rapportere bugs/fejl direkte til os.')
    TriggerEvent('chat:addSuggestion', '/humør', 'Brug denne funktion for at skifte dit ansigtsudtryk.')
    TriggerEvent('chat:addSuggestion', '/e', 'Brug denne funktion for at lave en handling.')
    TriggerEvent('chat:addSuggestion', '/k', 'Overgivelse ved at ligge på knæ med hænderne over hovedet.')
    TriggerEvent('chat:addSuggestion', '/tshirt', 'Tager din tshirt af/på.')
    TriggerEvent('chat:addSuggestion', '/jakke', 'Tager dine jakke af/på.')
    TriggerEvent('chat:addSuggestion', '/hat', 'Tager din hat af/på.')
    TriggerEvent('chat:addSuggestion', '/hjelm', 'Tager din hjelm af/på.')
    TriggerEvent('chat:addSuggestion', '/maske', 'Tager din maske af/på.')
    TriggerEvent('chat:addSuggestion', '/bukser', 'Tager din bukser af/på.')
    TriggerEvent('chat:addSuggestion', '/sko', 'Tager din sko af/på.')
    TriggerEvent('chat:addSuggestion', '/slips', 'Tager dit slips af/på.')
    TriggerEvent('chat:addSuggestion', '/skift', 'Sætter dig i føresædet.')
    TriggerEvent('chat:addSuggestion', '/passager', 'Sætter dig i passagersædet.')
    TriggerEvent('chat:addSuggestion', '/bagsæde1', 'Sætter dig i venstre bagsæde.')
    TriggerEvent('chat:addSuggestion', '/bagsæde2', 'Sætter dig i højre bagsæde.')
    TriggerEvent('chat:addSuggestion', '/humør glad', 'Får dig til at se glad ud.')
    TriggerEvent('chat:addSuggestion', '/humør normal', 'Får dig til at se normal ud.')
    TriggerEvent('chat:addSuggestion', '/humør sur', 'Får dig til at se sur ud.')
    TriggerEvent('chat:addSuggestion', '/humør bekymret', 'Får dig til at se bekymret ud.')
    TriggerEvent('chat:addSuggestion', '/humør ked', 'Får dig til at se ked ud.')
    TriggerEvent('chat:addSuggestion', '/humør fuld', 'Får dig til at se fuld ud.')
    TriggerEvent('chat:addSuggestion', '/humør sover', 'Får dig til at lukke øjnene.')
    TriggerEvent('chat:addSuggestion', '/humør smerte', 'Får dig til at se ud som om at du er i smerte.')
    TriggerEvent('chat:addSuggestion', '/e armbøjninger', 'Lav armbøjninger.')
    TriggerEvent('chat:addSuggestion', '/e bladblæser', 'Stå med en bladblæser.')
    TriggerEvent('chat:addSuggestion', '/e bor', 'Bor i jorden.')
    TriggerEvent('chat:addSuggestion', '/e brolove', 'Giv en broder noget kærlighed!.')
    TriggerEvent('chat:addSuggestion', '/e bbq', 'Bør kun anvendes over en grill!.')
    --TriggerEvent('chat:addSuggestion', '/e cam', 'Stå med et filmkamera.')
    TriggerEvent('chat:addSuggestion', '/e damn', 'Damn son!')
    TriggerEvent('chat:addSuggestion', '/e dj', 'Stå som en DJ.')
    TriggerEvent('chat:addSuggestion', '/e dans', 'Stå og dans.')
    TriggerEvent('chat:addSuggestion', '/e drillepind', 'Stå som en drillepind.')
    TriggerEvent('chat:addSuggestion', '/e dobbeltfuck', 'Ræk fuck med begge hænder.')
    TriggerEvent('chat:addSuggestion', '/e drik', 'Drik en stor øl.')
    TriggerEvent('chat:addSuggestion', '/e flex', 'Flex dine muskler.')
    TriggerEvent('chat:addSuggestion', '/e facepalm', 'Dæk dit ansigt med din hånd.')
    TriggerEvent('chat:addSuggestion', '/e fisk', 'Stå med en fiskestang.')
    TriggerEvent('chat:addSuggestion', '/e fingerknep', 'Lav "fingerknep" men hændernde.')
    TriggerEvent('chat:addSuggestion', '/e frygt', 'Frygt for dit liv.')
    TriggerEvent('chat:addSuggestion', '/e gangsterdans', 'Dans som en OG.')
    TriggerEvent('chat:addSuggestion', '/e politi', 'Stå som en Politimand.')
    TriggerEvent('chat:addSuggestion', '/e høst', 'Bruges til at høste kokain mm.')
    TriggerEvent('chat:addSuggestion', '/e hammer', 'Stå med en hammer')
    TriggerEvent('chat:addSuggestion', '/e hep', 'Stå og hep!')
    TriggerEvent('chat:addSuggestion', '/e kamera', 'Stå med et fotokamera.')
    --TriggerEvent('chat:addSuggestion', '/e kikkert', 'Stå med en kikkert.')
    TriggerEvent('chat:addSuggestion', '/e kaffe', 'Stå med en kop kaffe, kan også kombineres med sid.')
    --TriggerEvent('chat:addSuggestion', '/e kost', 'Stå med en kost.')
    TriggerEvent('chat:addSuggestion', '/e knækfingre', 'Knæk dine fingre.')
    TriggerEvent('chat:addSuggestion', '/e kort', 'Stå med et kort over byen.')
    TriggerEvent('chat:addSuggestion', '/e knæ', 'Sæt dig på knæ.')
    TriggerEvent('chat:addSuggestion', '/e krydsarme', 'Stå med krydsede arme.')
    TriggerEvent('chat:addSuggestion', '/e læn', 'Læn dig op ad en mur.')
    TriggerEvent('chat:addSuggestion', '/e læn2', 'Læn dig forover.') -- fix!
    TriggerEvent('chat:addSuggestion', '/e luder', 'Stå som en luder.')
    TriggerEvent('chat:addSuggestion', '/e luder2', 'Stå som en luder.')
    TriggerEvent('chat:addSuggestion', '/e ligpåmaven', 'Lig dig på maven.')
    TriggerEvent('chat:addSuggestion', '/e ligpåryggen', 'Lig dig på ryggen.')
    TriggerEvent('chat:addSuggestion', '/e ligpåsiden', 'Lig dig på siden.')
    TriggerEvent('chat:addSuggestion', '/e løb', 'Løb på stedet.')
    TriggerEvent('chat:addSuggestion', '/e mobil', 'Stå med telefonen fremme, kan også kombineres med sid.')
    --TriggerEvent('chat:addSuggestion', '/e mic', 'Stå med en nyheds-mikrofon.')
    TriggerEvent('chat:addSuggestion', '/e musik', 'Spil på trommer eller guitar.')
    TriggerEvent('chat:addSuggestion', '/e mavebøjninger', 'Lav mavebøjninger på jorden.')
    TriggerEvent('chat:addSuggestion', '/e notesblok', 'Stå med en notesblok.')
    TriggerEvent('chat:addSuggestion', '/e optag', 'optag med din telefon.')
    TriggerEvent('chat:addSuggestion', '/e peace', 'Peace love and harmony <3')
    TriggerEvent('chat:addSuggestion', '/e plant', 'Grav eller plant i jorden.')
    TriggerEvent('chat:addSuggestion', '/e sidned', 'Sid ned på jorden.')
    TriggerEvent('chat:addSuggestion', '/e pilnæse', 'Stik fingeren i næsen og grav efter guld.')
    TriggerEvent('chat:addSuggestion', '/e ryg', 'Ryg en cigaret.')
    TriggerEvent('chat:addSuggestion', '/e rage', 'Gå amok!.')
    TriggerEvent('chat:addSuggestion', '/e rygjoint', 'Ryg en joint.')
    TriggerEvent('chat:addSuggestion', '/e skør', 'Lav "du er skør tegn".')
    TriggerEvent('chat:addSuggestion', '/e sid', 'Sid ned - oftest på en stol.')
    TriggerEvent('chat:addSuggestion', '/e statue', 'Stå som en statue.')
    TriggerEvent('chat:addSuggestion', '/e salute', 'Gør honnør.')
    TriggerEvent('chat:addSuggestion', '/e skråtop', 'Ræk fuck.')
    TriggerEvent('chat:addSuggestion', '/e syredans', 'Dans som havde du taget frimærker!')
    TriggerEvent('chat:addSuggestion', '/e stilledans', 'Dans stille/akavet.') -- fix!
    TriggerEvent('chat:addSuggestion', '/e suicide', 'Begå selvmord - Kræver en pistol.')
    TriggerEvent('chat:addSuggestion', '/e tigger', 'Stå som en tigger.')
    TriggerEvent('chat:addSuggestion', '/e trafik', 'Stå og diriger trafik.')
    TriggerEvent('chat:addSuggestion', '/e træn', 'Løft en vægtstang.')
    TriggerEvent('chat:addSuggestion', '/e træn2', 'Lav pull-ups.')
    TriggerEvent('chat:addSuggestion', '/e tys', 'Tys på folk.')
    TriggerEvent('chat:addSuggestion', '/e thumbsup', 'Giv en thumbsup.')
    TriggerEvent('chat:addSuggestion', '/e tjekperson', 'Tjek en person.')
    TriggerEvent('chat:addSuggestion', '/e udklipsholder', 'Stå med en udklipsholder, kan kombineres med sid.')
    --TriggerEvent('chat:addSuggestion', '/e utålmodig', 'Stå som var du utålmodig.')
    TriggerEvent('chat:addSuggestion', '/e vagt', 'Stå som en sikkerhedsvagt.')
    TriggerEvent('chat:addSuggestion', '/e wank', 'Wank i luften.')
    TriggerEvent('chat:addSuggestion', '/e vask', 'Vask dig selv - Skal bruges nær vand.')
    TriggerEvent('chat:addSuggestion', '/e vaskvindue', 'Vask et vindue med en klud.')
    TriggerEvent('chat:addSuggestion', '/e yoga', 'Dyrk yoga.')
    TriggerEvent('chat:addSuggestion', '/e øl', 'stå og dans med en øl i hånden.')
end)

local emotePlaying = false
Delay = false
function playEmote(task)
    local ped = GetPlayerPed(-1)
    if not DoesEntityExist(ped) then
        return false
    end
    local veh = GetVehiclePedIsUsing(ped)
    if DoesEntityExist(veh) then
        TriggerEvent("pNotify:SendNotification", {text = "Du kan ikke bruge emotes i et køretøj!", type = "error", timeout = 2000, layout = "centerLeft"})
        return false
    end
    if emotePlaying then
        delProps(ped)
    end
    if IsPedInAnyVehicle(GetPlayerPed(-1)) and IsPedActiveInScenario(GetPlayerPed(-1)) and Drink then -- Tjekker om spilleren er i et køretøj
        return false
    end
    if IsEntityPlayingAnim(GetPlayerPed(-1), "random@arrests@busted", "idle_a", 3) then
        return false

    elseif task == "PROP_HUMAN_SEAT_BENCH" then

        local heading = GetEntityHeading(GetPlayerPed(-1))
        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TaskStartScenarioAtPosition(GetPlayerPed(-1), task, x, y, z-1, heading, 0, 0, false)
    elseif task == "damn" then

        TaskPlayAnim(GetPlayerPed(-1), "gestures@f@standing@casual", "gesture_damn", 8.0, 8.0, -1, 50, 0, false, false, false)

    elseif task == "kys" then
        loadAnimDict("anim@mp_player_intcelebrationfemale@finger_kiss")

        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationfemale@finger_kiss", "finger_kiss", 8.0, 8.0, -1, 50, 0, false, false, false)

        --PARAPLY EMOTE HER
    elseif task == "test" then
        loadAnimDict("amb@code_human_wander_drinking@beer@female@base")

        local prop = "p_amb_brolly_01"

        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_wander_drinking@beer@female@base", "static", 5.0, -1, -1, 50, 0, false, false, false)
        --TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
        --TaskPlayAnim(GetPlayerPed(PlayerId()), "amb@code_human_wander_drinking@beer@female@base", "base", 1.0, -1, -1, 50, 0, 0, 0, 0)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 1, 0)

        Drink = true
        emotePlaying = true
        ----KAFFE KODE GOES HERE
    elseif task == "kaffe" then
        loadAnimDict("amb@world_human_aa_coffee@idle_a")

        local prop = "p_amb_coffeecup_01"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_aa_coffee@idle_a", "idle_b", 12.0, -1, -1, 50, 1, false, false, false)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0)
        Drink = true
        emotePlaying = true


    elseif task == "gangsterdans" then
        loadAnimDict("missfbi3_sniping")
        TaskPlayAnim(GetPlayerPed(-1), "missfbi3_sniping", "dance_m_default", 5.0, -1, -1, 1, 0, false, false, false)

    elseif task == "syredans" then
        loadAnimDict("misschinese2_crystalmazemcs1_cs")
        TaskPlayAnim(GetPlayerPed(-1), "misschinese2_crystalmazemcs1_cs", "dance_loop_tao", -1, -1, -1, 1, 0, false, false, false)

    elseif task == "udklipsholder" then
        loadAnimDict("amb@lo_res_idles@")

        local prop = "p_amb_clipboard_01"
        TaskPlayAnim(GetPlayerPed(-1), "amb@lo_res_idles@", "world_human_clipboard_lo_res_base", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0xeb95), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Drink = true
        emotePlaying = true
    elseif task == "bladblæser" then
        loadAnimDict("amb@world_human_gardener_leaf_blower@idle_a")

        local prop = "prop_leaf_blower_01"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_gardener_leaf_blower@idle_a", "idle_a", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x6f06), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Drink = true
        emotePlaying = true
    elseif task == "krydsarme" then
        loadAnimDict("amb@world_human_hang_out_street@male_c@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_hang_out_street@male_c@base", "base", -1, -1, -1, 50, 0, false, false, false)


    elseif task == "dobbeltfuck" then
        loadAnimDict("anim@mp_player_intupperfinger")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intupperfinger", "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )


    elseif task == "facepalm" then
        loadAnimDict("anim@mp_player_intupperface_palm")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intupperface_palm", "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )


    elseif task == "pilnæse" then
        loadAnimDict("anim@mp_player_intuppernose_pick")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intuppernose_pick", "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )


    elseif task == "skør" then
        loadAnimDict("anim@mp_player_intupperyou_loco")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intupperyou_loco", "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )

    elseif task == "suicide" and HasPedGotWeapon(GetPlayerPed(-1), "WEAPON_PISTOL", false) then
        local theGunThatKillU = GetHashKey("WEAPON_PISTOL")
        SetCurrentPedWeapon(GetPlayerPed(-1), theGunThatKillU, true)

        loadAnimDict("mp_suicide")
        TaskPlayAnim(GetPlayerPed(-1), "mp_suicide", "pistol", 8.0, 1.0, -1, 0, 1, 1, 0, 0 )
        Wait(1200)
        SetEntityHealth(GetPlayerPed(-1), 105)

    elseif task == "dans" then
        loadAnimDict("rcmnigel1bnmt_1b")
        TaskPlayAnim(GetPlayerPed(-1), "rcmnigel1bnmt_1b", "dance_loop_tyler", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "armbøjninger" then
        loadAnimDict("amb@world_human_push_ups@male@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_push_ups@male@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(3500)
        loadAnimDict("amb@world_human_push_ups@male@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_push_ups@male@base", "base", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )

    elseif task == "kamera" then
        loadAnimDict("amb@world_human_paparazzi@male@enter")
        local prop = "prop_pap_camera_01"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_paparazzi@male@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x6f06), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Wait(1500)
        loadAnimDict("amb@world_human_paparazzi@male@idle_a")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_paparazzi@male@idle_a", "idle_c", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
        Drink = true
        emotePlaying = true
    elseif task == "mavebøjninger" then
        loadAnimDict("amb@world_human_sit_ups@male@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_sit_ups@male@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(3500)
        loadAnimDict("amb@world_human_sit_ups@male@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_sit_ups@male@base", "base", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )

    elseif task == "rygjoint" then
        local prop = "p_amb_joint_01"
        loadAnimDict("amb@world_human_smoking_pot@male@idle_a")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_smoking_pot@male@idle_a", "idle_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0xeb95), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Wait(5000)
        loadAnimDict("amb@world_human_smoking_pot@male@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_smoking_pot@male@base", "base", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
        emotePlaying = true
    elseif task == "tigger" then
        loadAnimDict("amb@world_human_bum_freeway@male@base")
        local prop = "prop_beggers_sign_03"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_bum_freeway@male@base", "base", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x6f06), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Drink = true
        emotePlaying = true
    elseif task == "vasktest" then
        loadAnimDict("amb@world_human_bum_wash@male@high@idle_a")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_bum_wash@male@high@idle_a", "idle_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )

    elseif task == "trafik" then
        loadAnimDict("amb@world_human_car_park_attendant@male@idle_a")
        local prop = "prop_parking_wand_01"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_car_park_attendant@male@idle_a", "idle_c", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x6f06), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Drink = true
        emotePlaying = true
    elseif task == "ligpåryggen" then
        loadAnimDict("amb@world_human_sunbathe@male@back@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_sunbathe@male@back@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(4000)
        TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SUNBATHE_BACK")

    elseif task == "læn2" then
        loadAnimDict("amb@prop_human_bum_shopping_cart@male@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(1500)
        TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_SHOPPING_CART")

    elseif task == "ryg" then
        loadAnimDict("amb@world_human_smoking@male@male_a@enter")
        local prop = "ng_proc_cigarette01a"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_smoking@male@male_a@enter", "enter", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x6f06), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Drink = true
        Wait(13000)
        TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING")
        emotePlaying = true

    elseif task == "dj" then
        loadAnimDict("anim@mp_player_intcelebrationmale@dj")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@dj", "dj", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )

    elseif task == "brolove" then
        loadAnimDict("anim@mp_player_intcelebrationmale@bro_love")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@bro_love", "bro_love", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "fingerknep" then
        loadAnimDict("anim@mp_player_intcelebrationmale@dock")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@dock", "dock", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "skråtop" then
        loadAnimDict("anim@mp_player_intcelebrationmale@finger")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@finger", "finger", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "rage" then
        loadAnimDict("anim@mp_player_intcelebrationmale@freakout")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@freakout", "freakout", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "knækfingre" then
        loadAnimDict("anim@mp_player_intcelebrationmale@knuckle_crunch")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@knuckle_crunch", "knuckle_crunch", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "peace" then
        loadAnimDict("anim@mp_player_intcelebrationmale@peace")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@peace", "peace", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "dollyno" then
        loadAnimDict("anim@mp_player_intcelebrationfemale@no_way")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationfemale@no_way", "no_way", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "salute" then
        loadAnimDict("anim@mp_player_intcelebrationmale@salute")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@salute", "salute", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "tys" then
        loadAnimDict("anim@mp_player_intcelebrationmale@shush")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@shush", "shush", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "thumbsup" then
        loadAnimDict("anim@mp_player_intcelebrationfemale@thumbs_up")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationfemale@thumbs_up", "thumbs_up", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "drillepind" then
        loadAnimDict("anim@mp_player_intcelebrationmale@thumb_on_ears")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@thumb_on_ears", "thumb_on_ears", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "wank" then
        loadAnimDict("anim@mp_player_intcelebrationmale@wank")
        TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

    elseif task == "ligpåmaven" then
        loadAnimDict("amb@world_human_sunbathe@male@front@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_sunbathe@male@front@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(4000)
        TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SUNBATHE")

    elseif task == "knæ" then
        loadAnimDict("amb@medic@standing@kneel@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(7500)
        loadAnimDict("amb@medic@standing@kneel@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base", "base", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )

    elseif task == "statue" then
        loadAnimDict("amb@world_human_statue@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_statue@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(3000)
        TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_HUMAN_STATUE")

    elseif task == "optag" then
        loadAnimDict("amb@world_human_mobile_film_shocking@male@enter")
        local prop = "prop_amb_phone"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_mobile_film_shocking@male@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Wait(2500)
        loadAnimDict("amb@world_human_mobile_film_shocking@male@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_mobile_film_shocking@male@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
        emotePlaying = true
    elseif task == "frygt" then
        loadAnimDict("amb@code_human_cower_stand@male@enter")
        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_cower_stand@male@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        Wait(500)
        loadAnimDict("amb@code_human_cower_stand@male@idle_a")
        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_cower_stand@male@idle_a", "idle_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )

    elseif task == "kikkert" then
        loadAnimDict("amb@world_human_binoculars@male@enter")
        local prop = "prop_binoc_01"
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_binoculars@male@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Wait(1000)
        loadAnimDict("amb@world_human_binoculars@male@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_binoculars@male@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
        emotePlaying = true
    elseif task == "notesblok" then
        loadAnimDict("amb@medic@standing@timeofdeath@enter")
        local prop = "p_notepad_01_s"
        TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@timeofdeath@enter", "enter", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
        local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(100)
        local netid = ObjToNet(propspawned)
        prop_net = netid
        AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0xeb95), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
        Wait(6000)
        loadAnimDict("amb@medic@standing@timeofdeath@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@timeofdeath@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
        emotePlaying = true

    elseif task == "repairtest" then
        loadAnimDict("amb@world_human_vehicle_mechanic@male@idle_a")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_vehicle_mechanic@male@idle_a", "idle_b", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
        Wait(19000)
        loadAnimDict("amb@world_human_vehicle_mechanic@male@exit")
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_vehicle_mechanic@male@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )





        ----GLAD HUMØR KODE GOES HERE
    elseif task == "skid" then
        Poop(ped)

    elseif task == "mic" then
        Mic()

    elseif task == "cam" then
        Cam()

    elseif task == "mic2" then
        Mic2()

    elseif task == "phone" then
        Phone()


    elseif not Delay then
        TaskStartScenarioInPlace(GetPlayerPed(-1), task)
        Delay = true

    end
    return true
end

RegisterNetEvent('hp_emote:pee')
AddEventHandler('hp_emote:pee', function()
    local ped = GetPlayerPed(-1)
    Pee(ped, 1)
end)

function Pee(ped, normal)
    local Player = ped
    if IsPedSittingInAnyVehicle(Player) then

        return false
    end
    local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

    local animDictionary = 'missbigscore1switch_trevor_piss'
    local animName = 'piss_loop'

    local sex = "male"
    if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
        sex = 'female'
    end
    if normal == 1 then
        RequestAnimDict(animDictionary)

        while not HasAnimDictLoaded(animDictionary) do
            Citizen.Wait(1)
        end
        if sex == 'male' then
            local heading = GetEntityPhysicsHeading(PlayerPed)
            TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
        elseif sex == 'female' then
            RequestAnimDict('missfbi3ig_0')
            while not HasAnimDictLoaded('missfbi3ig_0') do
                Citizen.Wait(1)
            end
            local heading = GetEntityPhysicsHeading(PlayerPed)
            TaskPlayAnim(PlayerPed, 'missfbi3ig_0', 'shit_loop_trev', 8.0, -8.0, -1, 0, 0, false, false, false)
        end
    end
    local bone = GetPedBoneIndex(PlayerPed, 11816)
    local particleDictionary = "core"
    local particleName = "ent_amb_peeing"

    RequestNamedPtfxAsset(particleDictionary)

    while not HasNamedPtfxAssetLoaded(particleDictionary) do
        Citizen.Wait(1)
    end
    SetPtfxAssetNextCall(particleDictionary)

    local effect = ""
    if normal == 1 then
        if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
            effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.55, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)
        else
            effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.1, -90.0, 0.0, 20.0, bone, 2.0, false, false, false)
        end
    else
        effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.1, -90.0, 0.0, 20.0, bone, 2.0, false, false, false)
    end
    Citizen.Wait(3500)
    StopParticleFxLooped(effect, 0)
    TriggerServerEvent("hp_emotes:updatepiss")
end

AddEventHandler("emote:start", function(name)
    if emotes[name] ~= nil then
        if playEmote(emotes[name]) then
            TriggerEvent("pNotify:SendNotification",{text = "Afspiller emote:<b style='color:lightblue';> "..name.."",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
            reset()
        end
    else
        TriggerEvent("pNotify:SendNotification",{text = "Denne emote findes ikke",type = "error",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
    end
end)

RegisterNetEvent("emote:startWithoutNotify")
AddEventHandler("emote:startWithoutNotify", function(name)
    if emotes[name] ~= nil then
        if playEmote(emotes[name]) then
            reset()
        end
    else
        TriggerEvent("pNotify:SendNotification",{text = "Denne emote findes ikke",type = "error",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
    end
end)

RegisterNetEvent("emote:stop")
AddEventHandler("emote:stop", function()
    delProps(GetPlayerPed(-1))
end)

AddEventHandler("emote:dog", function(name)
    if dogemotes[name] ~= nil then
        if playEmote(dogemotes[name]) then
            TriggerEvent("pNotify:SendNotification",{text = "Afspiller emote:<b style='color:lightblue';> "..name.."",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
        end
    else
        TriggerEvent("pNotify:SendNotification",{text = "Denne emote findes ikke",type = "error",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
    end
end)


AddEventHandler("emote:mood", function(name)
    if moods[name] ~= nil then
        if playEmote(moods[name]) then
            SetFacialIdleAnimOverride(GetPlayerPed(-1), moods[name])
            TriggerEvent("pNotify:SendNotification",{text = "Humør:<b style='color:lightblue';> "..name.."",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
        end
    else
        TriggerEvent("pNotify:SendNotification",{text = "Dette humør findes ikke",type = "error",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
    end
end)

AddEventHandler("emote:display", function()
    displayEmotes()
end)



function reset()
    Wait(5000)
    Delay = false

end

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        if Drink then
            DisablePlayerFiring(PlayerId(), true)
            DisableControlAction(0,25,true) -- disable aim
            DisableControlAction(0, 44,  true) -- INPUT_COVER
            DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
            SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
        end
    end
end)

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then
            if IsDisabledControlJustReleased( 0, 20 ) then -- INPUT_MULTIPLAYER_INFO (Z)
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_push_ups@male@base", "base", 3) then
                    loadAnimDict("amb@world_human_push_ups@male@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_push_ups@male@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_sit_ups@male@base", "base", 3) then
                    loadAnimDict("amb@world_human_sit_ups@male@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_sit_ups@male@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING") then
                    loadAnimDict("amb@world_human_smoking@male@male_a@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_smoking@male@male_a@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base", "base", 3) then
                    loadAnimDict("amb@medic@standing@kneel@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@code_human_wander_texting@male@base", "static", 3) then
                    loadAnimDict("amb@world_human_stand_mobile@male@text@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_stand_mobile@male@text@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "cellphone@female", "cellphone_call_listen_base", 3) then
                    loadAnimDict("amb@world_human_stand_mobile@male@text@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_stand_mobile@male@text@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_mobile_film_shocking@male@base", "base", 3) then
                    loadAnimDict("amb@world_human_mobile_film_shocking@male@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_mobile_film_shocking@male@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@code_human_cower_stand@male@idle_a", "idle_a", 3) then
                    loadAnimDict("amb@code_human_cower_stand@male@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_cower_stand@male@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_binoculars@male@base", "base", 3) then
                    loadAnimDict("amb@world_human_binoculars@male@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_binoculars@male@@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                if IsEntityPlayingAnim(GetPlayerPed(-1), "amb@medic@standing@timeofdeath@base", "base", 3) then
                    loadAnimDict("amb@medic@standing@timeofdeath@exit")
                    TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@timeofdeath@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
                end
                ClearPedTasks(ped)
                DetachEntity(NetToObj(prop_net), 1, 1)
                DeleteEntity(NetToObj(prop_net))
                DeleteObject(NetToObj(prop_net))
                StopScreenEffect(Rampage)
                --  SetFacialIdleAnimOverride(GetPlayerPed(-1), "mood_normal_1")
                ClearFacialIdleAnimOverride(ped)
                Drink = false
                emotePlaying = false

            end
        end
    end
end)

function Repair()
    loadAnimDict("amb@world_human_vehicle_mechanic@male@idle_a")
    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_vehicle_mechanic@male@idle_a", "idle_b", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
    Wait(26000)
    loadAnimDict("amb@world_human_vehicle_mechanic@male@exit")
    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_vehicle_mechanic@male@exit", "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )

end



function Poop(ped)
    local Player = ped
    local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

    local particleDictionary = "scr_amb_chop"
    local particleName = "ent_anim_dog_poo"
    local animDictionary = 'missfbi3ig_0'
    local animName = 'shit_loop_trev'

    RequestNamedPtfxAsset(particleDictionary)

    while not HasNamedPtfxAssetLoaded(particleDictionary) do
        Citizen.Wait(0)
    end

    RequestAnimDict(animDictionary)

    while not HasAnimDictLoaded(animDictionary) do
        Citizen.Wait(0)
    end

    SetPtfxAssetNextCall(particleDictionary)

    --gets bone on specified ped
    bone = GetPedBoneIndex(PlayerPed, 11816)

    --animation
    TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)

    --2 effets for more shit
    effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)
    Wait(3500)
    effect2 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.0, false, false, false)
    Wait(1000)

    StopParticleFxLooped(effect, 0)
    Wait(10)
    StopParticleFxLooped(effect2, 0)
end

local carkey = nil
function carKeys(ped)
    if carkey ~= nil then delProp(carkey) carkey = nil end

    anim = "mp_common"
    loadAnimDict(anim)

    local prop = "p_car_keys_01"
    local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
    local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
    Citizen.Wait(100)
    local netid = ObjToNet(propspawned)
    carkey = netid                                                                                --0.02, -0.01, 0.0, 0.0, 0.0, 70.0, 0, 0, 0, 0, 0, 1


    TaskPlayAnim(GetPlayerPed(-1), anim, "givetake1_a", 5.0, -1, -1, 50, 0, false, false, false)
    Wait(200)
    AttachEntityToEntity(propspawned, ped, GetPedBoneIndex(ped, 0x6F06), -0.025, -0.025, 0.044, 0.0, 0.0, 60.0, 0, 0, 0, 0, 0, 1)
    Wait(1300)
    delProp(carkey)
    ClearPedSecondaryTask(ped)
    carkey = nil
end

RegisterNetEvent('ftn:carkeys') -- Repair emoten til mekanikere
AddEventHandler('ftn:carkeys', function()
    carKeys(GetPlayerPed(-1))
end)

local holdingphone = false
local holdingphone2 = false
local usingphone = false
local phoneModel = "prop_amb_phone"
local phoneanimDict = "amb@code_human_wander_texting@male@base"
local phoneanimName = "static"
local phoneModel2 = "prop_npc_phone_02"
local phoneanimDict2 = "cellphone@"
local phoneanimName2 = "cellphone_call_out"
local phone_net = nil
local phone_net2 = nil

function Phone()
    local ped = GetPlayerPed(-1)
    if not DoesEntityExist(ped) then
        return false
    end
    local veh = GetVehiclePedIsUsing(ped)
    if DoesEntityExist(veh) then
        --TriggerEvent("pNotify:SendNotification", {text = "Du kan ikke bruge emotes i et køretøj!", type = "error", timeout = 2000, layout = "centerLeft"})
        return false
    end
    loadAnimDict("amb@world_human_stand_mobile@male@text@enter")
    local prop = "prop_amb_phone"
    TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_stand_mobile@male@text@enter", "enter", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
    local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
    Citizen.Wait(100)
    local netid = ObjToNet(propspawned)
    prop_net = netid
    AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
    Wait(2000)
    loadAnimDict("amb@code_human_wander_texting@male@base")
    TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_wander_texting@male@base", "static", 8.0, 1.0, -1, 49, 0, 0, 0, 0)

    Drink = true
    emotePlaying = true
end

function PhoneEar()
    local ped = GetPlayerPed(-1)
    if not DoesEntityExist(ped) then
        return false
    end
    local veh = GetVehiclePedIsUsing(ped)
    if DoesEntityExist(veh) then
        --TriggerEvent("pNotify:SendNotification", {text = "Du kan ikke bruge emotes i et køretøj!", type = "error", timeout = 2000, layout = "centerLeft"})
        return false
    end
    loadAnimDict("cellphone@female")

    local prop = "prop_amb_phone"
    TaskPlayAnim(GetPlayerPed(-1), "cellphone@female", "cellphone_call_listen_base", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
    local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -4.0)
    local propspawned = CreateObject(GetHashKey(prop), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
    Citizen.Wait(100)
    local netid = ObjToNet(propspawned)
    prop_net = netid
    AttachEntityToEntity(propspawned, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1)
    Drink = true
    emotePlaying = true
end

function Phone33()
    if not holdingphone then
        RequestModel(GetHashKey(phoneModel))
        while not HasModelLoaded(GetHashKey(phoneModel)) do
            Citizen.Wait(100)
        end

        while not HasAnimDictLoaded(phoneanimDict) do
            RequestAnimDict(phoneanimDict)
            Citizen.Wait(100)
        end

        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local phonespawned = CreateObject(GetHashKey(phoneModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(phonespawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(phonespawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        loadAnimDict("amb@code_human_wander_texting@male@base")
        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_wander_texting@male@base", "static", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
        phone_net = netid
        holdingphone = true
        emotePlaying = true
    else
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(phone_net), 1, 1)
        DeleteEntity(NetToObj(phone_net))
        phone_net = nil
        holdingphone = false
        usingphone = false
        emotePlaying = false
    end
end


function PhoneEar33()
    if not holdingphone2 then
        RequestModel(GetHashKey(phoneModel2))
        while not HasModelLoaded(GetHashKey(phoneModel2)) do
            Citizen.Wait(100)
        end

        while not HasAnimDictLoaded(phoneanimDict2) do
            RequestAnimDict(phoneanimDict2)
            Citizen.Wait(100)
        end

        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local phonespawned = CreateObject(GetHashKey(phoneModel2), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(phonespawned2)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(phonespawned2, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        loadAnimDict("cellphone@")
        TaskPlayAnim(GetPlayerPed(-1), "cellphone@", "cellphone_call_out", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
        phone_net2 = netid
        holdingphone2 = true
        emotePlaying = true
    else
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(phone_net2), 1, 1)
        DeleteEntity(NetToObj(phone_net2))
        phone_net2 = nil
        holdingphone2 = false
        usingphone2 = false
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if holdingphone then
            while not HasAnimDictLoaded(phoneanimDict) do
                RequestAnimDict(phoneanimDict)
                Citizen.Wait(100)
            end

            if not IsEntityPlayingAnim(PlayerPedId(), phoneanimDict, "static", 3) then
                TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
                TaskPlayAnim(GetPlayerPed(PlayerId()), phoneanimDict, "static", 1.0, -1, -1, 50, 0, 0, 0, 0)
            end

            DisablePlayerFiring(PlayerId(), true)
            DisableControlAction(0,25,true) -- disable aim
            DisableControlAction(0, 44,  true) -- INPUT_COVER
            DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
            SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)

            if (IsPedInAnyVehicle(GetPlayerPed(-1), -1) and GetPedVehicleSeat(GetPlayerPed(-1)) == -1) or IsPedCuffed(GetPlayerPed(-1)) or holdingMic then
                ClearPedSecondaryTask(GetPlayerPed(-1))
                DetachEntity(NetToObj(phone_net), 1, 1)
                DeleteEntity(NetToObj(phone_net))
                phone_net = nil
                holdingphone = false
                usingphone = false
            end
        end
    end
end)


function Phone2()
    if not holdingphone then
        RequestModel(GetHashKey(phoneModel))
        while not HasModelLoaded(GetHashKey(phoneModel)) do
            Citizen.Wait(100)
        end
        while not HasAnimDictLoaded(phoneanimDict) do
            RequestAnimDict(phoneanimDict)
            Citizen.Wait(100)
        end
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local phonespawned = CreateObject(GetHashKey(phoneModel), plyCoords.x, plyCoords.y, plyCoords.z, true, true, false)
        Citizen.Wait(1000)
        local netid = ObjToNet(phonespawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(phonespawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), -0.00, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        TaskPlayAnim(GetPlayerPed(GetPlayerPed(-1)), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
        TaskPlayAnim(GetPlayerPed(GetPlayerPed(-1)), phoneanimDict, phoneanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
        phone_net = netid
        holdingphone = false
        Drink = true
        emotePlaying = true
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Drink then

            DisablePlayerFiring(PlayerId(), true)
            DisableControlAction(0,25,true) -- disable aim
            DisableControlAction(0, 44,  true) -- INPUT_COVER
            DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
            SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)

            if (IsPedInAnyVehicle(GetPlayerPed(-1), -1) and GetPedVehicleSeat(GetPlayerPed(-1)) == -1) or IsPedCuffed(GetPlayerPed(-1)) or holdingMic then
                ClearPedSecondaryTask(GetPlayerPed(-1))
                DetachEntity(NetToObj(phone_net), 1, 1)
                DeleteEntity(NetToObj(phone_net))
                phone_net = nil
                holdingphone = false
                usingphone = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    local dict = "anim@mp_player_intupperwave"
    local ped = GetPlayerPed(-1)
    local sitting = IsPedSittingInAnyVehicle(ped)

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    local wave = false
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 113) and not IsPedInAnyVehicle(PlayerPedId(), true) and not IsPedSwimming(PlayerPedId(), true) then
            if not wave and not sitting then
                TaskPlayAnim(GetPlayerPed(-1), dict, "idle_a", 8.0, 8.0, -1, 49, 0, false, false, false)
                wave = true
            else
                wave = false
                ClearPedSecondaryTask(GetPlayerPed(-1))
            end
        elseif IsPedInAnyVehicle(PlayerPedId(), true) and wave == true then
            wave = false
            ClearPedSecondaryTask(GetPlayerPed(-1))
        end
        if wave == true then
            DisableControlAction(0, 24, true) -- attack
            DisableControlAction(0, 25, true) -- aim
            DisableControlAction(0, 37, true) -- weapon wheel
            DisableControlAction(0, 44, true) -- cover
            DisableControlAction(0, 45, true) -- reload
            DisableControlAction(0, 140, true) -- light attack
            DisableControlAction(0, 141, true) -- heavy attack
            DisableControlAction(0, 142, true) -- alternative attack
            DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
        end
    end
end)

function delProp(prop)
    DetachEntity(NetToObj(prop), 1, 1)
    DeleteEntity(NetToObj(prop))
    DeleteObject(NetToObj(prop))
end


function delProps(ped)
    ClearPedTasks(ped)
    DetachEntity(NetToObj(prop_net), 1, 1)
    DeleteEntity(NetToObj(prop_net))
    DeleteObject(NetToObj(prop_net))
    StopScreenEffect(Rampage)
    ClearFacialIdleAnimOverride(ped)
    Drink = false
    emotePlaying = false
end

-- POLITI PIS --
local holstered = true

-- RESTRICTED PEDS --
-- I've only listed peds that have a remote speaker mic, but any ped listed here will do the animations.
local skins = {
    "s_m_y_cop_01",
    "s_f_y_cop_01",
    "s_m_y_hwaycop_01",
    "s_m_y_sheriff_01",
    "s_f_y_sheriff_01",
    "s_m_y_ranger_01",
    "s_f_y_ranger_01",
}

-- Add/remove weapon hashes here to be added for holster checks.
local weapons = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
}

-- RADIO ANIMATIONS --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait( 0 )
        local ped = PlayerPedId()

        local weaponHash = GetHashKey("WEAPON_COMBATPISTOL")
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) and HasPedGotWeapon(ped, weaponHash, false) then
            if not IsPauseMenuActive() then
                loadAnimDict( "random@arrests" )
                if IsControlJustReleased( 0, 19 ) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
                    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'off', 0.1)
                    ClearPedTasks(ped)
                    SetEnableHandcuffs(ped, false)
                else
                    if IsControlJustPressed( 0, 19 ) and HasPedGotWeapon(ped, weaponHash, false) and not IsPlayerFreeAiming(PlayerId()) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
                        delProps(ped)
                        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'on', 0.1)
                        TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                        SetEnableHandcuffs(ped, true)
                    elseif IsControlJustPressed( 0, 19 ) and HasPedGotWeapon(ped, weaponHash, false) and IsPlayerFreeAiming(PlayerId()) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
                        delProps(ped)
                        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'on', 0.1)
                        TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                        SetEnableHandcuffs(ped, true)
                    end
                    if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_enter", 3) then
                        DisableActions(ped)
                    elseif IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
                        DisableActions(ped)
                    end
                end
            end
        end
    end
end )

-- HOLD WEAPON HOLSTER ANIMATION --

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) and CheckSkin(ped) then
            DisableControlAction( 0, 20, true ) -- INPUT_MULTIPLAYER_INFO (Z)
            if not IsPauseMenuActive() then
                loadAnimDict( "reaction@intimidation@cop@unarmed" )
                if IsDisabledControlJustReleased( 0, 20 ) then -- INPUT_MULTIPLAYER_INFO (Z)
                    ClearPedTasks(ped)
                    SetEnableHandcuffs(ped, false)
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                else
                    if IsDisabledControlJustPressed( 0, 20 ) and CheckSkin(ped) then -- INPUT_MULTIPLAYER_INFO (Z)
                        delProps(ped)
                        SetEnableHandcuffs(ped, true)
                        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                        TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                    end
                    if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "reaction@intimidation@cop@unarmed", "intro", 3) then
                        DisableActions(ped)
                    end
                end
            end
        end
    end
end )

-- HOLSTER/UNHOLSTER PISTOL --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) and CheckSkin(ped) then
            loadAnimDict( "rcmjosh4" )
            loadAnimDict( "weapons@pistol@" )
            if CheckWeapon(ped) then
                if holstered then
                    TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                    Citizen.Wait(600)
                    ClearPedTasks(ped)
                    holstered = false
                end
                SetPedComponentVariation(ped, 9, 0, 0, 0)
            elseif not CheckWeapon(ped) then
                if not holstered then
                    TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                    Citizen.Wait(500)
                    ClearPedTasks(ped)
                    holstered = true
                end
                SetPedComponentVariation(ped, 9, 1, 0, 0)
            end
        end
    end
end)

-- DO NOT REMOVE THESE! --

function CheckSkin(ped)
    for i = 1, #skins do
        if GetHashKey(skins[i]) == GetEntityModel(ped) then
            return true
        end
    end
    return false
end

function CheckWeapon(ped)
    for i = 1, #weapons do
        if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
            return true
        end
    end
    return false
end

function DisableActions(ped)
    DisableControlAction(1, 140, true)
    DisableControlAction(1, 141, true)
    DisableControlAction(1, 142, true)
    DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
    DisablePlayerFiring(ped, true) -- Disable weapon firing
end
-- ARME OVER KORS
Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    local handsup = false
    while true do
        Citizen.Wait(0)
        local lPed = GetPlayerPed(-1)
        if IsControlJustPressed(INPUT_REPLAY_SHOWHOTKEY, 121) and not IsPedInAnyVehicle(lPed, false) then -- INSERT
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)
