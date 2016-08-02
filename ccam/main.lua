--[[ CCAM App ]]--
local args = { ... }

local usage = "Usage: ccam <option> [application]"
        .. "\nAvaliable options:"
        .. "\n install to install an app"
        .. "\n update to update an app"
        .. "\n updateall to update all apps and libraries"
        .. "\n remove to remove an app"

if #args < 2 and args[1] ~= "updateall" then
	print(usage)
elseif #args == 2 then
	local option = args[1]
    local app_name = args[2]
    

	if option == "install" then
		ccam.downloadApp(app_name)
        
	elseif option == "update" then
		ccam.updateApp(app_name)
        
	elseif option == "remove" then
		ccam.deleteApp(app_name)
        
	else
		print(usage)
	end

elseif #args < 2 and args[1] == "updateall" then
	local apps = fs.list(CCAM_CONF.APP_DIR)
	local libs = fs.list(CCAM_CONF.LIB_DIR)

	-- Update apps
	for _, v in pairs(apps) do
		print("Updating app: " .. v)
		ccam.updateApp(v, false)
	end

	-- Update libs
	for _, v in pairs(libs) do
		print("Updating lib: " .. v)
		ccam.updateApp(v, true)
	end

end