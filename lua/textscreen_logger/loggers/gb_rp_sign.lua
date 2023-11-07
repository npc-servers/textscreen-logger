local class = "gb_rp_sign"
local ent = scripted_ents.GetStored( class )
if not ent then return end

local ts = ent.t

ts._SetupDataTables = ts._SetupDataTables or ts.SetupDataTables
function ts:SetupDataTables()
    self:_SetupDataTables()

    self._SetText = self._SetText or self.SetText
    function self:SetText( text )
        if text == "Made by Mac with <3" then
            self:_SetText( text )
            return
        end

        timer.Simple( 0, function()
            if not IsValid( self ) then return end
            local owner = self:CPPIGetOwner()
            TEXTSCREENLOGGER.Log( self, owner, class, text )
        end )

        return self:_SetText( text )
    end
end
