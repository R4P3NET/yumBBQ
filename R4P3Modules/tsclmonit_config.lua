--[[
                ___ ___  ___  
 _  _ _  _ _ __ | _ ) _ )/ _ \ 
| || | || | '  \| _ \ _ \ (_) |
 \_, |\_,_|_|_|_|___/___/\__\_\
 |__/          https://r4p3.net
 
 Description:
 TS3Client Encrypt/Decrypt Function Hook
 
  --> By Dedmen @ R4P3.NET
]]--




module("tsclmonit_config", package.seeall);

offset = ffi.cast("int",dbg.getModule("ts3client_win32.exe").ImageBase);

file = io.open ("TS3CLMonit.log" , "a")

local function decrpyt_hook(context)
    local length = cast("int", context.reg32.edi);
    if length > 5 then
            local charptr =cast("char*", context.reg32.ebp);
            if (charptr[0] < 0x60)  or (charptr[0] == 'G') then
            charptr =cast("char*", cast("int", charptr) + 11)
            end
   
            file:write("RECV_CRYPT: %s".. str(charptr, length).."\n");
			printf(" ");
            printf("RECV_CRYPT: %s", str(charptr, length));
    end
end
codecave.inject(nil,offset+ 0x59C46E, decrpyt_hook)--, codecave.INTERCEPT_RETURN

local function encrypt_hook(context)
        local length = cast("int", context.reg32.ebx);
        if length > 5 then
            file:write("SEND_CRYPT: %s", str(cast("char*", context.reg32.ecx), length).."\n");
			printf(" ");
            printf("SEND_CRYPT: %s", str(cast("char*", context.reg32.ecx), length));
        end
end
codecave.inject(nil, offset+0x59D429, encrypt_hook)--, codecave.INTERCEPT_PRE
