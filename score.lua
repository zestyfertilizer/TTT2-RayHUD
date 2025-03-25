-- score.lua
-- ...

local function UpdateScore()
    -- Octagonal HUD scorekeeping
    local players = player.GetAll()
    for i, player in ipairs(players) do
        local score = player:GetScore()
        -- RayHUD score label
        local scoreLabel = vgui.Create("DLabel", hud)
        scoreLabel:SetText("Score: " .. score)
        scoreLabel:SetFont("RayHUD_Font")
        scoreLabel:SetColor(Color(255, 255, 255))
        scoreLabel:SetPos(10, 40 + (i - 1) * 20)
    end
end

hook.Add("Think", "UpdateScore", UpdateScore)
