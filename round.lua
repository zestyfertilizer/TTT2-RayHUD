-- round.lua
-- ...

local function UpdateRound()
    -- Octagonal HUD round management
    local round = GetRound()
    -- RayHUD round label
    local roundLabel = vgui.Create("DLabel", hud)
    roundLabel:SetText("Round: " .. round)
    roundLabel:SetFont("RayHUD_Font")
    roundLabel:SetColor(Color(255, 255, 255))
    roundLabel:SetPos(10, 60)
end

hook.Add("Think", "UpdateRound", UpdateRound)
