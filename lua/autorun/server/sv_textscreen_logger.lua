TEXTSCREENLOGGER = TEXTSCREENLOGGER or {}
TEXTSCREENLOGGER.prefix = "[TSL]"
TEXTSCREENLOGGER.ranksToReceiveLog = {
    ["admin"] = true,
    ["moderator"] = true,
    ["operator"] = true,
    ["superadmin"] = true,
    ["trialstaff"] = true
}

include( "textscreen_logger/sv_core.lua" )
