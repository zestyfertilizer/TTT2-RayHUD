-- cl_scoreboard.lua
-- ...

local function DrawScoreboard()
    -- RayHUD scoreboard background
    draw.RoundedBox(8, 0, 0, 400, 300, Color(30, 30, 30, 200))

    -- Octagonal HUD scoreboard layout
    local scoreboard = vgui.Create("DPanel")
    scoreboard:SetSize(400, 300)
    scoreboard:SetPos(0, 0)
    scoreboard:SetBackgroundColor(Color(30, 30, 30, 200))

    -- RayHUD scoreboard title
    local title = vgui.Create("DLabel", scoreboard)
    title:SetText("Scoreboard")
    title:SetFont("RayHUD_Font")
    title:SetColor(Color(255, 255, 255))
    title:SetPos(10, 10)

    -- Octagonal HUD scoreboard columns
    local columns = {}
    for i = 1, 5 do
        local column = vgui.Create("DPanel", scoreboard)
        column:SetSize(80, 280)
        column:SetPos(10 + (i - 1) * 80, 40)
        column:SetBackgroundColor(Color(30, 30, 30, 200))
        table.insert(columns, column)
    end

    -- RayHUD scoreboard rows
    local rows = {}
    for i = 1, 10 do
        local row = vgui.Create("DPanel", scoreboard)
        row:SetSize(400, 20)
        row:SetPos(0, 40 + (i - 1) * 20)
        row:SetBackgroundColor(Color(30, 30, 30, 200))
        table.insert(rows, row)
    end

    -- Octagonal HUD scoreboard data
    local data = {}
    for i = 1, 10 do
        local player = player.GetAll()[i]
        if player then
            local row = rows[i]
            row:SetText(player:Nick())
            row:SetColor(Color(255, 255, 255))
        end
    end

    -- RayHUD scoreboard layout
    scoreboard:Layout()
end

hook.Add("HUDPaint", "DrawScoreboard", DrawScoreboard)
