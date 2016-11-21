--[[ CCAM App ]]--
local args = { ... }

local usage = "Usage: ccam <option> [resource]"
        .. "\nAvaliable options:"
        .. "\n install <name>"
        .. "\n remove <name>"
        .. "\n update <name>"
        .. "\n updateall to update all apps and libraries"
        .. "\n list to list all avaliable apps"
        .. "\n search <name>"

if #args == 2 then
	local option = args[1]
    local resource = args[2]


	if option == "install" then
		libccam.download(resource)

	elseif option == "update" then
		libccam.update(resource)

	elseif option == "remove" then
		libccam.delete(resource)

  elseif option == "search" then
    libccam.search(resource)

	else
		print(usage)
	end

elseif #args == 1 and args[1] == "updateall" then
	libccam.updateall(false)

elseif #args == 1 and args[1] == "list" then
	libccam.list()

else
	print(usage)
end
