resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "https://revolutionradio.ru:8443/live.ogg", volume = 0.2 }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://stream.radioreklama.bg/nrj.ogg", volume = 0.2 }
supersede_radio "RADIO_04_PUNK" { url = "http://netradio.radioabc.dk", volume = 0.2, name = "Radio_ABC" }
supersede_radio "RADIO_05_TALK_01" { url = "http://netradio.skala.fm/esbjerg", volume = 0.2, name = "Skala_FM" }
supersede_radio "RADIO_06_COUNTRY" { url = "http://stream1.partyfm.dk/Party128web", volume = 0.2, name = "PartyFM" }
supersede_radio "RADIO_07_DANCE_01" { url = "http://lyt.til.clubfm.dk:8000/CFM320", volume = 0.2, name = "ClubFM" }


files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
