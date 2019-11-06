resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'DLCTEXT_FILE' 'dlctext.meta'

files {
  'vehiclelayouts.meta',
  'handling.meta',
  'vehicles.meta',
  'carcols.meta',
  'carvariations.meta',
  'dlctext.meta'
}

client_script {
	'vehicle_names.lua'
}

--[[
__________         ___ ___                             .__                  ___________   .__               
\______   \___.__./   |   \ ___.__.______   ___________|__| ____   ____    /   _____/  | _|__| ____   ______
 |    |  _<   |  /    ~    <   |  |\____ \_/ __ \_  __ \  |/  _ \ /    \   \_____  \|  |/ /  |/    \ /  ___/
 |    |   \\___  \    Y    /\___  ||  |_> >  ___/|  | \/  (  <_> )   |  \  /        \    <|  |   |  \\___ \ 
 |______  // ____|\___|_  / / ____||   __/ \___  >__|  |__|\____/|___|  / /_______  /__|_ \__|___|  /____  >
        \/ \/           \/  \/     |__|        \/                     \/          \/     \/       \/     \/ 
--]]