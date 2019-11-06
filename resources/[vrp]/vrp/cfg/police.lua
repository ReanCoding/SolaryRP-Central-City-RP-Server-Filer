
local cfg = {}

-- PCs positions
cfg.pcs = {
  {1853.21, 3689.51, 34.2671},
  {442.030609130859, -978.72705078125, 30.6896057128906},
  {-448.97076416016,6012.4208984375,31.71639251709},
  {459.83016967773,-989.00830078125,24.914873123169}
}

-- vehicle tracking configuration
cfg.trackveh = {
  min_time = 300, -- min time in seconds
  max_time = 600, -- max time in seconds
  service = "police" -- service to alert when the tracking is successful
}

-- wanted display
cfg.wanted = {
  blipid = 458,
  blipcolor = 38,
  service = "police"
}

-- illegal items (seize)
cfg.seizable_items = {
  "dirty_money",
  "hampblade",
  "joints",
  "kokainblade",
  "kokain",
  "opium",
  "morfin",
  "heroin",
  "pseudo-efedrin",
  "methamfetamin",
  "lsd",
  "syre",
  "*wbody",
  "*wammo",
  "meldrøje-svamp"
}

-- jails {x,y,z,radius}
cfg.jails = {
  {459.485870361328,-1001.61560058594,24.914867401123,2.1},
  {459.305603027344,-997.873718261719,24.914867401123,2.1},
  {459.999938964844,-994.331298828125,24.9148578643799,1.6}
}

-- fines
-- map of name -> money
--cfg.fines = {
--  ["Diskrimination"] = 100,
--  ["Speeding"] = 250,
--  ["Stealing"] = 1000,
--  ["Organized crime (low)"] = 10000,
--  ["Organized crime (medium)"] = 25000,
--  ["Organized crime (high)"] = 50000
--}

return cfg
