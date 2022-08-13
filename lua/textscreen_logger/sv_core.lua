local ranksToGetLog = TEXTSCREENLOGGER.ranksToReceiveLog
util.AddNetworkString( "TextScreenLoggerLog" )

hook.Add( "OnEntityCreated", "TextScreenLogger", function( ent )
    timer.Simple( 0.01, function()
        if not IsValid( ent ) then return end
        local class = ent:GetClass()
        local textGetter = TEXTSCREENLOGGER.loggers[class]
        local owner = ent:CPPIGetOwner()

        if not textGetter then return end

        local text = textGetter( ent )
        TEXTSCREENLOGGER.log( owner, class, text )
        hook.Run( "TSLScreenSpawned", ent, owner, class, text )
    end )
end )

function TEXTSCREENLOGGER.sendToAdmins( text )
    for _, ply in ipairs( player.GetHumans() ) do
        if ranksToGetLog[ply:GetUserGroup()] then
            net.Start( "TextScreenLoggerLog" )
            net.WriteString( text )
            net.Send( ply )
        end
    end
end

function TEXTSCREENLOGGER.log( owner, class, text )
    local logString = TEXTSCREENLOGGER.prefix .. " " .. owner:GetName() or "NULL OWNER" .. " spawned " .. class .. " containing: \"" .. text .. "\""
    print( logString )
    ServerLog( logString .. "\n" )
    TEXTSCREENLOGGER.sendToAdmins( logString )
end

local loggerFiles = file.Find( "textscreen_logger/loggers/*.lua", "lsv" )
for _, loggerFile in ipairs( loggerFiles ) do
    pcall( include, "textscreen_logger/loggers/" .. loggerFile )
    print( TEXTSCREENLOGGER.prefix .. " loaded " .. loggerFile )
end

print( TEXTSCREENLOGGER.prefix .. " Initialized" )
