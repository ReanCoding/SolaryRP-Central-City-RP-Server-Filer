
local cfg = {}

-- size of the sms history
cfg.sms_history = 15

-- maximum size of an sms
cfg.sms_size = 500

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
  ["politi"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 300, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "~r~Central alarmen:~n~~s~",
    notify = "~b~Du har ringet til politiet.",
    answer_notify = "~b~Politiet er på vej."
  },
  ["ambulance"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 300, -- 5 minutes
    alert_permission = "emergency.service",
    alert_notify = "~r~Central alarmen:~n~~s~",
    notify = "~b~Du har ringet efter ambulancen.",
    answer_notify = "~b~Ambulancen er på vej."
  },
  ["taxa"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "taxi.service",
    alert_notify = "~y~Taxi alarm:~n~~s~",
    notify = "~y~Du har ringet til en taxa.",
    answer_notify = "~y~Din taxa er på vej."
  },
  ["mekaniker"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "repair.service",
    alert_notify = "~y~Alarm:~n~~s~",
    notify = "~y~Du har ringet efter en mekaniker.",
    answer_notify = "~y~En mekaniker er sendt ud."
  },
  ["STTSMekaniker"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "STTSMekaniker.service",
    alert_notify = "~y~Alarm:~n~~s~",
    notify = "~y~Du har ringet efter en mekaniker.",
    answer_notify = "~y~En mekaniker er sendt ud."

  },
  ["Brødrenes Autoværksted"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "ba.service",
    alert_notify = "~y~Alarm:~n~~s~",
    notify = "~y~Du har ringet efter en Brødrenes Autoværksted.",
    answer_notify = "~y~En mekaniker er sendt ud."
  }
}

-- define phone announces
-- image: background image for the announce (800x150 px)
-- price: amount to pay to post the announce
-- description (optional)
-- permission (optional): permission required to post the announce
cfg.announces = {
  ["admin"] = {
    --image = "nui://vrp_mod/announce_admin.png",
    image = "http://i.imgur.com/kjDVoI6.png",
    price = 0,
    description = "Admin only.",
    permission = "admin.announce"
  },
  ["politi"] = {
    --image = "nui://vrp_mod/announce_police.png",
    image = "https://i.imgur.com/hcFn9qe.png",
    price = 0,
    description = "Kun for politiet, ex: wanted advert.",
    permission = "police.announce"
  },
  ["annonce"] = {
    --image = "nui://vrp_mod/announce_commercial.png",
    image = "https://i.imgur.com/fjoYxNU.png",
    description = "Kommercielle ting (køb, salg, arbejde)).",
    price = 5000
  },
  ["fest"] = {
    --image = "nui://vrp_mod/announce_party.png",
    image = "https://i.imgur.com/5OwbqU4.png",
    description = "Arranger et event eller ligende.",
    price = 5000
  }
}

return cfg
