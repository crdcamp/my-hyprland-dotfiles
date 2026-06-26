-------------------
--- KEYBINDINGS ---
-------------------
local vars = require("variables")
local mainMod = "SUPER"

-- Essentials
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal)) -- New terminal window
hl.bind(mainMod .. " + Q", hl.disp.exec_cmd(killactive))   -- Kill currently active window
hl.bind(mainMod .. " + SHIFT + ESCAPE",                    -- Exit Hyprland
    hl.disp.exec_cmd(vars.terminal .. "--title " .. vars.terminal .. vars.fileManager))

-- Move Window Focus
hl.bind(mainMod .. " H", hl.disp.focus({ direction = "left", group_aware = false }))
hl.bind(mainMod .. " L", hl.disp.focus({ direction = "right", group_aware = false }))
hl.bind(mainMod .. " K", hl.disp.focus({ direction = "up", group_aware = false }))
hl.bind(mainMod .. " J", hl.disp.focus({ direction = "down", group_aware = false }))

-- Move Windows
hl.bind(mainMod .. " + SHIFT + H", hl.disp.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.disp.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.disp.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.disp.move({ direction = "down" }))

-- Resize Windows
hl.bind(mainMod .. " LEFT", hl.disp.resize({ -35, 0, activewindow }, { repeating = true }))
hl.bind(mainMod .. " RIGHT", hl.disp.resize({ 35, 0, activewindow }, { repeating = true }))
hl.bind(mainMod .. " UP", hl.disp.resize({ 0, 35, activewindow }, { repeating = true }))
hl.bind(mainMod .. " DOWN", hl.disp.resize({ 0, -35, activewindow }, { repeating = true }))

-- Fullscreen
hl.bind(mainMod .. " F", hl.disp.fullscreen({ "fullscreen", "toggle" }))
hl.bind(mainMod .. " SHIFT + F", hl.disp.fullscreen({ "maximized", "toggle" }))

-- Float Window Management
hl.bind(mainMod, " V", hl.disp.float({}))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
