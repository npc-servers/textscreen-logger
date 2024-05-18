local class = "gmod_wire_textscreen"
local ent = scripted_ents.GetStored( class )
if not ent then return end

local ts = ent.t
ts._TriggerInput = ts._TriggerInput or ts.TriggerInput

function ts:TriggerInput( name, value )
    if name ~= "String" then
        return ts._TriggerInput( self, name, value )
    end

    timer.Simple( 0, function()
        if not IsValid( self ) then return end
        local owner = self:CPPIGetOwner()
        TEXTSCREENLOGGER.Log( self, owner, class, value, true )
    end )

    return ts._TriggerInput( self, name, value )
end
