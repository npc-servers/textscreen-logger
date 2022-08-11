TEXTSCREENLOGGER.loggers["sammyservers_textscreen"] = function( ent )
    if not ent.lines then return end

    local str = ""
    for _, lineTbl in pairs( ent.lines ) do
        if lineTbl.text ~= "" then
            str = str .. lineTbl.text .. ", "
        end
    end

    local text = string.sub( str, 1, #str - 2 )

    return text
end
