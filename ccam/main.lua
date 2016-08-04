--[[ CCAM App ]]--
local args = { ... }

local usage = "Usage: ccam <option> [resource]"
        .. "\nAvaliable options:"
        .. "\n install <name>"
        .. "\n remove <name>"
        .. "\n update <name>"
        .. "\n updateall to update all apps and libraries"

if #args == 2 then
	local option = args[1]
    local resource = args[2]
    

	if option == "install" then
		ccam.download(resource)
        
	elseif option == "update" then
		ccam.update(resource)
        
	elseif option == "remove" then
		ccam.delete(resource)
        
	else
		print(usage)
	end

elseif #args == 1 and args[1] == "updateall" then
	-- Update apps
	for _, v in pairs(fs.list(CCAM_CONF.APP_DIR)) do
		print("\nUpdating app: " .. v)
		ccam.update(v, false)
	end

	-- Update libs
	for _, v in pairs(fs.list(CCAM_CONF.LIB_DIR)) do
		print("\nUpdating lib: " .. v)
		ccam.update(v, true)
	end

else
	print(usage)
end