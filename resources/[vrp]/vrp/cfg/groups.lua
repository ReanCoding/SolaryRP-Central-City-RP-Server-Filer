local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
    ["ejer"] = {
        "player.group.add",
        "player.group.remove",
        "player.givemoney",
        "player.noclip",
        "player.giveitem",
        "player.ban",
        "vehicle.repair",
        "player.kick",
        "player.unban",
        "police.seize.items",
        "police.seize.weapons",
        "player.coords",
        "admin.besked",
        "admin.revive",
        "admin.deleteveh",
        "staff.gun",
        "admin.spawnveh",
        "ledelse.fix",
        "admin.easy_unjail",
        "admin.spikes",
        "player.tptowaypoint",
        "staff.revive",
        "player.tptome",
        "player.tpto",
        "player.tptocoords",
        "admin.bm_freeze",
        "player.whitelist",
        "player.unwhitelist",
        "staff.chat",
        "admin.tickets",
        "player.list",
        "admin.godmode"
    },

        ["ledelse"] = {
       "player.group.add",
       "player.group.remove",
       "player.noclip",
       "player.givemoney",
       "player.ban",
       "vehicle.repair",
       "player.kick",
       "player.unban",
       "player.giveitem",
       "police.seize.items",
       "police.seize.weapons",
       "player.coords",
       "admin.besked",
       "admin.revive",
       "admin.deleteveh",
       "staff.gun",
       "admin.spawnveh",
       "ledelse.fix",
       "admin.easy_unjail",
       "admin.spikes",
       "player.tptowaypoint",
       "staff.revive",
       "player.tptome",
       "player.tpto",
       "player.tptocoords",
       "admin.bm_freeze",
       "player.whitelist",
       "player.unwhitelist",
       "staff.chat",
       "admin.tickets",
       "player.list",
       "admin.godmode"
    },

    ["ban"] = {
        "player.unban",
        "player.ban",
        "staff.chat"
    },

    ["refund"] = {
        "player.givemoney",
        "player.giveitem"
    },

    ["jobs"] = {
        "player.group.add",
        "player.group.remove"
    },

    ["whitelist"] = {
        "player.whitelist",
        "player.unwhitelist"
    },

    ["biludvikler"] = {
        "admin.deleteveh",
        "admin.spawnveh",
        "player.cords",
        "player.kick",
        "player.tptowaypoint",
        "player.tptome",
        "player.tptocoords",
        "player.tpto",
        "player.noclip"
    },

    ["supporter"] = {
        "player.whitelist",
        "admin.tickets",
        "player.unwhitelist",
        "admin.deleteveh",
        "admin.besked",
        "admin.revive",
        "staff.revive",
        "player.coords",
        "admin.announce",   
        "player.kick",
        "player.tptowaypoint",
        "player.list",
        "player.tptome",
        "player.tptocoords",
        "player.tpto",
        "admin.bm_freeze",
        "staff.chat",
        "player.noclip"
    },

    ["mod"] = {
        "admin.deleteveh",
        "player.ban",
        "staff.revive",
	        "admin.besked",
        "player.coords",
        "admin.tickets",
        "staff.gun",
        "admin.announce",
        "emergency.revive",
        "player.kick",
        "police.menu",
        "police.seize.weapons",
        "police.seize.items",
        "police.easy_cuff",
        "admin.revive",
        "player.whitelist",
        "player.unwhitelist",
        "player.tptowaypoint",
        "player.list",
        "player.tptome",
        "player.tptocoords",
        "player.tpto",
        "admin.bm_freeze",
        "staff.chat",
        "player.noclip",
        "admin.godmode"
    },
    ["Dommer"] = {
        "court.doors",
        "kriminel.adgang",
        "Advokatchef.paycheck"
    },
    ["Peds"] = {
    },
    -- the group user is auto added to all logged players
    ["user"] = {
        "player.phone",
        "player.calladmin",
        "police.askid",
        "player.coords",
        "player.player_menu",
        "carjacker.lockpick",
        "player.fix_haircut",
        "player.store_weapons",
        "player.store_armor",
        "player.phone",
        "player.loot",
        "player.check",
        "toggle.service",
        "police.seizable",
        "god.chattitle",
        "alle.hvidvask" -- can be seized
    },
    ["Bilforhandler"] = {
        _config = { gtype = "job"},
        "bilforhandler.paycheck",
        "admin.spawnveh",
        "admin.deleteveh"
    },
    ["Rigspolitichef"] = {
        _config = { gtype = "Politi-Job"},
	    "Politichef.paycheck",
        "politi.ledelse.doors",
        "rigspolitichef.cloakroom",
        "police.pc"
    },
    ["Vicerigspolitichef"] = {
        _config = { gtype = "Politi-Job"},
	"politiledelse.paycheck",
        "politi.ledelse.doors",
        "Vicerigspolitichef.cloakroom",
        "police.pc"
    },
    ["Politiinspektør"] = {
        _config = { gtype = "Politi-Job"},
	    "Vicepolitichef.paycheck",
        "politi.ledelse.doors",
        "police.cloakroom",
        "police.pc"
    },
    ["civilbetjent"] = {
        _config = { gtype = "Politi-Job"},
	"politi.paycheck",
        "police.cloakroom",
        "police.pc"
    },
    ["ASK"] = {
        _config = { gtype = "Politi-Job"},
	"politi.paycheck",
        "aks.cloakroom",
        "police.pc"
    },
    ["Politibetjent"] = {
        _config = { gtype = "Politi-Job"},
	"politi.paycheck",
        "police.cloakroom",
        "police.pc",
        "police.loadshop"
    },
    ["Politielev"] = {
        _config = { gtype = "Politi-Job"},
	    "politielev.paycheck",
        "elev.cloakroom",
        "-bank.police",
        "-policeheli.garage",
        "police.pc"
    },
    ["Politi-Job"] = {
        _config = { gtype = "job"},
        "police.menu",
        "politi.ledelse.doors",
        "police.putinveh",
        "politi.onduty",
        "police.carsearch",
        "admin.deleteveh",
        "police.dd",
        "police.paycheck",
        "police.bodyarmor",
        "bank.police",
        "police.announce",
        "police.check",
        "police.easy_cuff",
        "police.easy_jail",
        "police.easy_unjail",
        "police.getoutveh",
        "police.jail",
        "-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
        "police.seize.items",
        "police.seize.weapons",
        "police.fine",
        "police.service",
        "police.store_weapons",
        "police.wanted",
        "emergency.revive",
        "holdup.police",
        "police.askid",
        "police.besked",
        "police.drag",
        "police.easy_fine",
        "police.garage",
        "policeheli.garage",
        "god.chattitle",
        "police.loadshop",
        "police.menu_interaction",
        "police.spikes"
    },
    ["Regionschef"] = {
        _config = { gtype = "EMS-Job" },
        "emergency.key",
        "Lægechef.paycheck"
    },
    ["EMS"] = {
        _config = { gtype = "EMS-Job" },
        "emergency.key",
        "emergency.paycheck"
    },
    ["EMS-Job"] = {
        _config = { gtype = "job" },
        "emergency.revive",
        "admin.deleteveh",
        "emergency.shop",
        "emergency.service",
        "emergency.market",
        "police.drag",
        "emergency.paycheck",
        "emergency.besked",
        "police.easy_cuff",
        "emergency.garage",
        "ems.cloakroom",
        "god.chattitle",
        "mission.emergency.transfer"
    },
    ["Mekaniker Chef"] = {
        _config = { gtype = "Mekaniker-Job"},
        "MekanikerChef.paycheck",
    },
    ["Mekaniker"] = {
        _config = { gtype = "Mekaniker-Job"},
        "Mekaniker.paycheck",
    },
    ["Mekaniker-Job"] = {
        _config = { gtype = "job"},
        "vehicle.repair",
        "mekaniker.adgang",
        "admin.deleteveh",
        "vehicle.replace",
        "repair.service",
        "repair.loadshop",
        "mekaniker.cloakroom",
        "repair.besked",
        "repair.menu",
        "god.chattitle",
        "police.menu_interaction"
    },
    ["Taxi"] = {
        _config = { gtype = "job" },
        "taxi.service",
        "taxi.garage",
        "taxi.paycheck",
        "taxi.besked",
        "god.chattitle",
        "mission.taxi.passenger"
    },
    ["Kriminel"] = {
        _config = { gtype = "job"},
        "kriminel.adgang",
        "user.paycheck",
        "god.chattitle"
    },

    ["Advokat"] = {
        _config = {  gtype = "job" },
        "Advokat.paycheck",
        "god.chattitle",
        "kriminel.adgang",
        "advokat.garage"
    },

    ["Våbenhandler"] = {
        _config = {  gtype = "job" },
        "kriminel.adgang",
        "user.paycheck",
        "vdealer.adgang",
        "god.chattitle",
        "mekaniker.adgang",
        "admin.deleteveh",
        "user.paycheck",
        "vehicle.replace",
        "repair.service",
        "repair.loadshop",
        "repair.besked",
        "repair.menu",
        "STTSMekaniker.service",
        "god.chattitle",
        "police.menu_interaction"

    },

    ["Miner"] = {
        _config = {  gtype = "job" },
        "miner.adgang",
        "god.chattitle",
        "Miner.paycheck"

   },

    ["STTS"] = {
        _config = {  gtype = "job" },
        "kriminel.adgang",
         "vehicle.repair",
        "mekaniker.adgang",
        "admin.deleteveh",
        "user.paycheck",
        "vehicle.replace",
        "repair.service",
        "repair.loadshop",
        "repair.besked",
        "repair.menu",
        "god.chattitle",
        "STTSMekaniker.service",
        "police.menu_interaction"

    },

    ["Pizzamand"] = {
        _config = {  gtype = "job" },
		"delivery.vehicle",
		"delivery.paycheck",
		"delivery.gopostal"
    },

    ["Skovhugger"] = {
        _config = {  gtype = "job" },
        "skovhugger.tree",
        "god.chattitle",
        "skovhugger.paycheck",
        "skovhugger.adgang"
    },
    ["Arbejdsløs"] = {
        _config = { gtype = "job" },
        "user.paycheck",
        "god.chattitle"
    }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
    [1] = { -- give superadmin and admin group to the first created user on the database
        "ejer",
        "mod"
    }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
    ["Jobcenteret "] = {
        _config = {x = -116.03520202637, y = -611.17431640625, z = 36.280727386475, blipid = 351, blipcolor = 47},
        "Taxi",
        "Miner",
        "Skovhugger",
        "Pizzamand",
        "Kriminel",
        "Arbejdsløs"
    },
    ["Solary-Auto"] = {
        _config = {x = -203.36010742188, y = -1328.2451171875, z = 34.894367218018, blipid = 446, blipcolor = 3},
        "Mekaniker Chef",
        "Mekaniker",
        "Arbejdsløs"
    },
    ["Kriminelle jobs"] = {
        _config = {x =-61.154624938965, y = -1218.4547119141, z = 28.7018699646},
        "Kriminel",
        "Arbejdsløs"
    }
}

return cfg