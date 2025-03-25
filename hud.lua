-- hud.lua
-- ...

local function DrawHUD()
    -- RayHUD background
    draw.RoundedBox(8, 0, 0, 400, 300, Color(30, 30, 30, 200))

    -- Octagonal HUD player tracking
    local players = player.GetAll()
    for i, player in ipairs(players) do
        local pos = player:GetPos()
        local ang = player:GetAngles()
        local name = player:Nick()

        -- RayHUD player label
        local label = vgui.Create("DLabel", hud)
        label:SetText(name)
        label:SetFont("RayHUD_Font")
        label:SetColor(Color(255, 255, 255))
        label:SetPos(10, 10 + (i - 1) * 20)
    end

    -- Octagonal HUD scorekeeping
    local scores = {}
    for i, player in ipairs(players) do
        local score = player:GetScore()
        table.insert(scores, score)
    end

    -- RayHUD score label
    local scoreLabel = vgui.Create("DLabel", hud)
    scoreLabel:SetText("Score: " .. table.concat(scores, ", "))
    scoreLabel:SetFont("RayHUD_Font")
    scoreLabel:SetColor(Color(255, 255, 255))
    scoreLabel:SetPos(10, 40 + (i - 1) * 20)
end

hook.Add("HUDPaint", "DrawHUD", DrawHUD)
