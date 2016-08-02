--[[ CCAM App ]]--
local args = { ... }

local usage = "Usage: ccam <option> [application]"
        .. "\nAvaliable options:"
        .. "\n install <name> to install an app"
        .. "\n update <name> to update an app"
        .. "\n updateall to update all apps and libraries"
        .. "\n remove <name> to remove an app"

if #args == 2 then
	local option = args[1]
    local app_name = args[2]
    

	if option == "install" then
		ccam.download(app_name)
        
	elseif option == "update" then
		ccam.update(app_name)
        
	elseif option == "remove" then
		ccam.delete(app_name)
        
	else
		print(usage)
	end

elseif #args == 1 and args[1] == "updateall" then
	-- Update apps
	for _, v in pairs(fs.list(CCAM_CONF.APP_DIR)) do
		print("Updating app: " .. v)
		ccam.update(v, false)
	end

	-- Update libs
	for _, v in pairs(fs.list(CCAM_CONF.LIB_DIR)) do
		print("Updating lib: " .. v)
		ccam.update(v, true)
	end

else
	print(usage)
end