local QBCore = exports[Config.Core]:GetCoreObject()


RegisterNetEvent("r6_pharmacy:Client:pharmacy")
AddEventHandler("r6_pharmacy:Client:pharmacy", function()
    if not IsEntityDead(GetPlayerPed(-1)) then
        local r6_pharmacy = {}
        r6_pharmacy.label = "pharmacy"
        r6_pharmacy.items = Config.pharmacyshop
        r6_pharmacy.slots = #Config.pharmacyshop
        TriggerServerEvent(Config.InvTrigger, "shop", "pharmacy_"..math.random(1, 99), r6_pharmacy)
    end
end)


function CreateNPC(type, model, anim, dict, pos, help) -- البوت لاتغير شي
    Citizen.CreateThread(function()
        local hash = GetHashKey(model)
        local talking = false
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Wait(1)
        end
        RequestAnimDict(anim)
        while not HasAnimDictLoaded(anim) do
            Wait(1)
        end
        local ped = CreatePed(type, hash, pos.x, pos.y, pos.z, pos.h, false, true)
        SetEntityHeading(ped, pos.h)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskPlayAnim(ped, anim, dict, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        while true do
            Citizen.Wait(0)
            local your = GetEntityCoords(GetPlayerPed(-1), false)
            if (Vdist(pos.x, pos.y, pos.z, your.x, your.y, your.z) < 2) and help ~= nil then
                SetTextComponentFormat("STRING")
                AddTextComponentString(help)
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end
        end
    end)
end

CreateNPC(4, "s_m_m_doctor_01", "amb@code_human_in_car_mp_actions@first_person@smoke@std@ds@base", "base",  -- البوت
    { x = 375.25, y = -829.5, z =  28.29, h = 263.12 }, "") -- مكان البوت




    Citizen.CreateThread(function()
        local blip = AddBlipForCoord(380.26974, -834.3272, 29.291669, 358.97299)
        SetBlipSprite(blip, 51)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 84)  
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Pharmacy")
        EndTextCommandSetBlipName(blip)
    end)
    