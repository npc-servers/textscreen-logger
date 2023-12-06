local ranksToGetLog = TEXTSCREENLOGGER.ranksToReceiveLog
util.AddNetworkString( "TextScreenLoggerLog" )

function TEXTSCREENLOGGER.sendToAdmins( text )
    for _, ply in ipairs( player.GetHumans() ) do
        if ranksToGetLog[ply:GetUserGroup()] then
            net.Start( "TextScreenLoggerLog" )
            net.WriteString( text )
            net.Send( ply )
        end
    end
end

function TEXTSCREENLOGGER.Log( ent, owner, class, text, hookonly )
    hook.Run( "TSLScreenSpawned", ent, owner, class, text )
    if hookonly then return end

    local logString = TEXTSCREENLOGGER.prefix .. " " .. owner:GetName() .. "<" .. owner:SteamID() .. "> spawned " .. class .. " containing: \"" .. text .. "\""
    print( logString )
    ServerLog( logString .. "\n" )
    TEXTSCREENLOGGER.sendToAdmins( logString )
end

local function loadLoggers()
    local loggerFiles = file.Find( "textscreen_logger/loggers/*.lua", "lsv" )
    for _, loggerFile in ipairs( loggerFiles ) do
        ProtectedCall( function()
            print( TEXTSCREENLOGGER.prefix .. " loading " .. loggerFile )
            include( "textscreen_logger/loggers/" .. loggerFile )
        end )
    end
end

hook.Add( "InitPostEntity", "TextScreenLogger", function()
    loadLoggers()
    TEXTSCREENLOGGER.Loaded = true
end )

if TEXTSCREENLOGGER.Loaded then
    loadLoggers()
end
