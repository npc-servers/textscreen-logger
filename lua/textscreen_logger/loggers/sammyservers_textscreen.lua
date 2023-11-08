local class = "sammyservers_textscreen"
local ent = scripted_ents.GetStored( class )
if not ent then return end

local ts = ent.t
ts._SetLine = ts._SetLine or ts.SetLine

function ts:SetLine( line, text, ... )
    if text == "" then return ts._SetLine( self, line, text, ... ) end

    local owner = self:CPPIGetOwner()
    TEXTSCREENLOGGER.Log( self, owner, class, text )
    return ts._SetLine( self, line, text, ... )
end
