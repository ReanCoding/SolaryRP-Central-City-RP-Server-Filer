
local cfg = {}

-- define customization parts
local parts = {
  ["Face"] = 0,
  ["Hair"] = 2,
  ["Hand"] = 3,
  ["Legs"] = 4,
  ["Shirt"] = 8,
  ["Shoes"] = 6,
  ["Jacket"] = 11,
  ["Hats"] = "p0",
  ["Glasses"] = "p1",
  ["Ears"] = "p2",
  ["Watches"] = "p6"
}

-- changes prices (any change to the character parts add amount to the total price)
cfg.drawable_change_price = 20
cfg.texture_change_price = 5


-- skinshops list {parts,x,y,z}
cfg.skinshops = {
}

return cfg
