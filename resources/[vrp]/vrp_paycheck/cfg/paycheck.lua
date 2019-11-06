--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]


local cfg = {}

-- paycheck and bill for users
cfg.message_paycheck = "Du modtog din løn: ~g~ Kr. " -- message that will show before payment of salary
cfg.message_bill = "Du betalte din skat: ~r~ Kr. " -- message that will show before payment of bill
cfg.post = "." -- message that will show after payment

cfg.bank = true -- if true money goes to bank, false goes to wallet

cfg.minutes_paycheck = 30 -- minutes between payment for paycheck
cfg.minutes_bill = 30 -- minutes between withdrawal for bill

cfg.paycheck_title_picture = "Danske Bank" -- define title for paycheck notification picture
cfg.paycheck_picture = "CHAR_BANK_MAZE" -- define paycheck notification picture want's to display
cfg.bill_title_picture = "Skat" -- define title for bill notification picture
cfg.bill_picture = "CHAR_MP_MORS_MUTUAL" -- define bill notification picture want's to display

cfg.paycheck = { -- ["permission"] = paycheck
  ["emergency.paycheck"] = 20000,
  ["politi.paycheck"] = 30000,
  ["kørelære.paycheck"] = 19000,
  ["Lima.paycheck"] = 35000,
  ["Politichef.paycheck"] = 65000,
  ["Vicepolitichef.paycheck"] = 50000,
  ["politiledelse.paycheck"] = 32000,
  ["Lægechef.paycheck"] = 40000,
  ["repair.paycheck"] = 20000,
  ["Miner.paycheck"] = 12500,
  ["rigspolitichef.paycheck"] = 90000,
  ["MekanikerLæring.paycheck"] = 15000,
  ["politielev.paycheck"] = 19000,
  ["vicerigspolitichef.paycheck"] = 85000,
  ["emselev.paycheck"] = 20000,
  ["taxi.paycheck"] = 16000,
  ["MekanikerChef.paycheck"] = 30000,  -- God løn til Evers:DDD
  ["Mekaniker.paycheck"] = 17000,
  ["delivery.paycheck"] = 10000,
  ["citizen.paycheck"] = 22500,
  ["Advokat.paycheck"] = 26000,
  ["Bilforhandker.paycheck"] = 16000,
  ["Advokatchef.paycheck"] = 45000,
  ["user.paycheck"] = 7500,
  ["skovhugger.paycheck"] = 12500

}

cfg.bill = { -- ["permission"] = withdrawal
  ["emergency.paycheck"] = 9000,
  ["politi.paycheck"] = 9500,
  ["kørelære.paycheck"] = 7000,
  ["Lima.paycheck"] = 8000,
  ["Vicepolitichef.paycheck"] = 10000,
  ["politiledelse.paycheck"] = 8000,
  ["Politichef.paycheck"] = 25000,
  ["rigspolitichef.paycheck"] = 10000,
  ["vicerigspolitichef.paycheck"] = 15000,
  ["Lægechef.paycheck"] = 8000,
  ["repair.paycheck"] = 5000,
  ["Miner.paycheck"] = 2500,
  ["politielev.paycheck"] = 3000,
  ["taxi.paycheck"] = 2000,
  ["MekanikerChef.paycheck"] = 8000,
  ["Mekaniker.paycheck"] = 7000,
  ["MekanikerLærling.paycheck"] = 6000,
  ["citizen.paycheck"] = 800,
  ["delivery.paycheck"] = 2000,
  ["Advokat.paycheck"] = 9000,
  ["Bilforhandker.paycheck"] = 8000,
  ["Advokatchef.paycheck"] = 10970,
  ["user.paycheck"] = 5000,
	["skovhugger.paycheck"] = 7000
}

return cfg