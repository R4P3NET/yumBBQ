--[[
                ___ ___  ___  
 _  _ _  _ _ __ | _ ) _ )/ _ \ 
| || | || | '  \| _ \ _ \ (_) |
 \_, |\_,_|_|_|_|___/___/\__\_\
 |__/          https://r4p3.net
 
 Description:
 yumBBQ TeamSpeak3 Auto inject configuration
 
 --> by Derp @ R4P3.NET
]]--




module("config", package.seeall);

_G.TARGETS = {	

	{
		--[[ Working on TS3Client  < 3.0.19 ]]--
		--[[ In order for automatic injection to work, MD5 must match with targeted process ]]--
		["name"]  = "TS3Client",
		["exe"]   = "ts3client_win32.exe",
		["title"] = "TS3CLMonit",
		["ver"]   = "3.0.18.2",
		["md5"]   = "0023aa3eb618d1ed33b794947a408107",
		["lua"]   = "R4P3Modules/tsclmonit_config.lua",
		["cfg"]   = "tsclmonit_config",
	},
	
	{
		--[[ Working on TS3Server 3.0.12.2/3 ]]--
		--[[ In order for automatic injection to work, MD5 must match with targeted process ]]--	
		["name"]  = "TS3Server",
		["exe"]   = "ts3server.exe",
		["title"] = "TS3SRVSQLMonit",
		["ver"]   = "3.0.12.3",
		["md5"]   = "8db3567742a0915efb56a74561c04535",
		["lua"]   = "R4P3Modules/tssrvsql_config.lua",
		["cfg"]   = "tssrvsql_config",
	},
}
if not _G.TARGET then return end
