Vim�UnDo� L�g��7�~؛><\���0�XJ]����rj   X                                   d��    _�                     1        ����                                                                                                                                                                                                                                                                                                                                                             d��t    �   0   1          1"silent !mkdir -p $HOME/.config/nvim/tmp/sessions5��    0                      �      2               5�_�                    L        ����                                                                                                                                                                                                                                                                                                                                                             d��    �   L   N   f    5��    L                      	                     5�_�                    Z   ,    ����                                                                                                                                                                                                                                                                                                                            g   !       Z   ,       V   1    d���     �   Y   Z          ,local config_path = vim.fn.stdpath("config")   Mlocal current_config_path = config_path .. "/lua/config/machine_specific.lua"   1if not vim.loop.fs_stat(current_config_path) then   ?	local current_config_file = io.open(current_config_path, "wb")   [	local default_config_path = config_path .. "/default_config/_machine_specific_default.lua"   ?	local default_config_file = io.open(default_config_path, "rb")   4	if default_config_file and current_config_file then   2		local content = default_config_file:read("*all")   $		current_config_file:write(content)   		io.close(default_config_file)   		io.close(current_config_file)   	end   end   "require("config.machine_specific")5��    Y                      

      �              5�_�                     Y        ����                                                                                                                                                                                                                                                                                                                            Z   !       Z   ,       V   1    d��    �   X   Y           5��    X                      	
                     5��