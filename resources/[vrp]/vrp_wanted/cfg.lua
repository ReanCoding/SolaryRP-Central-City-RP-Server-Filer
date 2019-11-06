------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--     Script made for Origin Network 26/01/2019     --
--   Copyright 2019 ©oMarkez. All rights reserved    --
-------------------------------------------------------

local cfg = {}

cfg.wantperm = "police.drag"
cfg.removewantperm = "police.drag"

cfg.wantedmsg = {
    alreadywanted = "Denne person er allerde efterlyst, vil du tilføje til hans efterlysning?",
    fullname = "Fulde Navn (med mellemrum mellem første & efternavn):",
    platenumber = "Nummerplade (med P og mellemrum):"
}

cfg.prompts = {
    registrationnr = "CPR-nummer:",
    registrationnotfound = "Ugyldigt CPR-nummer",
    needtowritereason = "Du skal skrive en grund!",
    namenotfound = "Kunne ikke finde dette navn i regiseret.",
    invalidname = "Ugyldigt navn.",
    platenotfound = "Kunne ikke finde denne nummerplade i registeret.",
    invalidplate = "Ugyldigt nummerplade.",
    idnotfound = "Ugyldigt ID."
}

cfg.div = {
    name = "Navn: ",
    registrationnr = "CPR: ",
    age = "Alder: ",
    status = "Status: ",
    reason = "Grund: ",
    wantedby = "Efterlyst af: ",
    wantedtime = "Dato på efterlysning: ",
    removediv = "Fjern Register"
}

cfg.menu = {
    wantedmenu = "Efterlysnings Menu",
    menudesc = "Efterlysnings Menu",

    getwanted = {
        title = "Søg i register",
        desc = "Søg i efterlysnings registeret."
    },

    wantname = {
        title = "Efterlys en person",
        desc = "Efterlys en person"
    },

    wantplate = {
        title = "Efterlys en nummerplade",
        desc = "Efterlys en nummerplade"
    },

    wantregistration = {
        title = "Efterlys et CPR-nr",
        desc = "Efterlys et CPR-nr"
    },

    removewanted = {
        title = "Fjern efterlysning",
        desc = "Fjern en efterlysning."
    }
}

function getConfig()
	return cfg
end