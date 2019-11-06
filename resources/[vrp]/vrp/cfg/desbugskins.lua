
local cfg = {}

-- define customization parts
local parts = {
  ["Ansigt"] = 0,
  ["Arme"] = 3,
  ["Bukser"] = 4,
  ["Hatte/Hjelme"] = "p0",
  ["Briller"] = "p1",
  ["Vest"] = 9,
}

-- changes prices (any change to the character parts add amount to the total price)
cfg.drawable_change_price = 20
cfg.texture_change_price = 5


-- skinshops list {parts,x,y,z}
cfg.desbugskins = {
  {parts,450.02682495117,-990.22454833984,30.689613342285},
}

return cfg
