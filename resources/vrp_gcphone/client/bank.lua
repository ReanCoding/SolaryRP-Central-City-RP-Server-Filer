--====================================================================================
--  Function APP BANK
--====================================================================================

RegisterNetEvent("vRP:updateBalanceGc")
AddEventHandler('vRP:updateBalanceGc', function(bank)
      SendNUIMessage({event = 'updateBankbalance', banking = bank})
end)
