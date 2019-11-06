local gates = {
    "p_barier_test_s",
    "prop_sec_barier_01a",
    "prop_sec_barier_02a",
    "prop_sec_barier_02b",
    "prop_sec_barier_03a",
    "prop_sec_barier_03b",
    "prop_sec_barier_04a",
    "prop_sec_barier_04b",
    "prop_sec_barier_base_01",
    "prop_sec_barrier_ld_01a",
    "prop_sec_barrier_ld_02a",
    "prop_fnccorgm_02d",
    "prop_fnccorgm_02e",
}
Citizen.CreateThread(function()
   while true do
        for i = 1, #gates do
            local player = PlayerId()
            local Ped = GetPlayerPed(player)
            local pedPos = GetEntityCoords(Ped, false)
            local gate = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 150.0, GetHashKey(gates[i]), 0, 0, 0)
            if gate ~= 0 then
                SetEntityAsMissionEntity(gate, 1, 1)
                DeleteObject(gate)
                SetEntityAsNoLongerNeeded(gate)
            end
        end
       Citizen.Wait(2500)
   end
end)