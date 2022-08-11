TEXTSCREENLOGGER.loggers["gb_rp_sign"] = function( ent )
    if not ent.GetText then return end

    return ent:GetText()
end
