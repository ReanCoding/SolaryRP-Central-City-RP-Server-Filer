
-- gui config file

local cfg = {}

-- additional css loaded to customize the gui display (see gui/design.css to know the available css elements)
-- it is not recommended to modify the vRP core files outside the cfg/ directory, create a new resource instead
-- you can load external images/fonts/etc using the NUI absolute path: nui://my_resource/myfont.ttf
-- example, changing the gui font (suppose a vrp_mod resource containing a custom font)
cfg.css = [[
@font-face {
  font-family: "Custom Font";
  src: url(nui://vrp_mod/customfont.ttf) format("truetype");
}

body{
  font-family: "Custom Font";
}
]]

-- list of static menu types (map of name => {.title,.blipid,.blipcolor,.permissions (optional)})
-- static menus are menu with choices defined by vRP.addStaticMenuChoices(name, choices)
cfg.static_menu_types = {
  ["emergency_heal"] = {
    title = "Heal"
  },
  ["police_weapons"] = {
    title = "Loadout",
    permissions = {"police.loadshop"},
    blipid = 205,
    blipcolor = 5
  }
}

-- list of static menu points
cfg.static_menus = {
  {"emergency_heal", 267.79260253906,-1357.0515136718,24.537786483764},
  --{"police_weapons", 459.66836547852,-979.20220947266,30.689582824708},
}

return cfg
