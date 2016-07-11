--[[
                ___ ___  ___  
 _  _ _  _ _ __ | _ ) _ )/ _ \ 
| || | || | '  \| _ \ _ \ (_) |
 \_, |\_,_|_|_|_|___/___/\__\_\
 |__/          https://r4p3.net
 
 Description:
 TS3Server Database Query Function Hook
 
 Note:

   INTERCEPT_RETURN Offsets
  
   3.0.12.2: 0x227F0
   3.0.12.3: 0x227F0
   3.0.12.4: 0x-----
  
  --> By Dedmen @ R4P3.NET
]]--




module("tssrvsql_config", package.seeall);

offset = ffi.cast("int",dbg.getModule("ts3server.exe").ImageBase);

file = io.open ("TSSRVSQLMonit.log" , "a")

local function getNextSQLCommand_hook(context)

    local length = cast("int*", context.reg32.eax + 0x10)[0];
    local data = cast("char**", context.reg32.eax)[0];
    if (length < 4) then
        return;
    end
    file:write("".. ffi.string(data,length).."\n");
    file:flush();
    printf("".. ffi.string(data,length).."\n");
end
codecave.inject(nil, offset+0x227F0, getNextSQLCommand_hook, codecave.INTERCEPT_RETURN)--, codecave.INTERCEPT_RETURN
