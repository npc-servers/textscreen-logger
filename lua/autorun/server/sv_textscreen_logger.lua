TEXTSCREENLOGGER = {}
TEXTSCREENLOGGER.prefix = "[TSL]"
TEXTSCREENLOGGER.loggers = {}
TEXTSCREENLOGGER.ranksToReceiveLog = {
    ["admin"] = true,
    ["moderator"] = true,
    ["operator"] = true,
    ["superadmin"] = true,
    ["Trial Staff"] = true
}

include( "textscreen_logger/sv_core.lua" )
