
local cfg = {}

-- minimum capital to open a business
cfg.minimum_capital = 45000

-- capital transfer reset interval in minutes
-- default: reset every 24h
cfg.transfer_reset_interval = 6*60

-- commerce chamber {blipid,blipcolor}
cfg.blip = {500,2} 

-- positions of commerce chambers
cfg.commerce_chambers = {
  {858.95965576172,-2496.8415527344,28.315881729126}
}

return cfg
