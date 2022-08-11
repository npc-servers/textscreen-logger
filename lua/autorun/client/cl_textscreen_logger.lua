net.Receive( "TextScreenLoggerLog", function()
    local logString = net.ReadString()
    print( logString )
end )
