--[[
    © ShipmasterKyle (Drgametime3d) 2022
    You paid good money for this right?
    Then why are you sharing it?
    Don't redistrubute this code.
    Thank you!
]]

-----|| Services ||-----
local RS = game:GetService("RunService")

-----|| Core Variables ||-----
--[[
    Determines if they will click the ground or the screen.
    - If you're using "ground" then you need a part called Earth with CanCollide
    off. The part should cover the clickable area
    - If you're using "object" then all the Objects need to have the same name
    and be in a folder in workspace called Objects.
    - If you're using "iframe" then you'll need to make sure the zindex layer of
    ALL of your ui is set to a value greater than 1 as the clickbox should be on
    the lowest layer.
]]
local clickMethod = script:GetAttribute("ClickMethod")
--Event for communicating with the server
local eve = game.ReplicatedStorage.Comms
--Password we send in sanity check.
local log = script:GetAttribute("Tags")
--Our Player
local Player = game.Players.LocalPlayer
--Our Player's UI
local PlayerGui = Player.PlayerGui
--Use task.wait as wait for performance
local wait = task.wait


-----|| Main Code ||-----

--Creates the stuff we'll use for Clicking.
local function renderClicks()
    if clickMethod == "ground" then
        local ground = workspace:FindFirstChild("Earth")
        if Earth then
            local trigger = Instance.new("ClickDetector")
            trigger.Name = "SimulatorObject"
        else
            error("Your clickMethod is set to "Ground" but you are missing an Earth Part.")
        end
    elseif clickMethod == "object" then
        if workspace:FindFirstChild("Object") then
            for i,v in pairs(workspace.Object:GetChildren()) do
                if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("Union") then
                    local trigger = Instance.new("ClickDetector")
                    trigger.Name = "SimulatorObject"
                end
            end
        else
            error("Your clickMethod is set to "Object" but you are missing a Object folder")
        end
    elseif clickMethod == "iframe" then
        local frameParent = Instance.new("ScreenGui")
        frameParent.Parent = PlayerGui
        frameParent.Name = "SimulatorObjectParent"
        local frame = Instance.new("TextButton")
        frame.Text = ""
        frame.Name = "SimulatorObject"
        frame.Transparency = 1
        frame.Size = UDim2.new(1,0,1,0)
        frame.ZIndex = 1
        frame.Parent = frameParent
    end
end

local function onClick(clickValue)
    if clickValue then
        eve:FireServer(Player, clickValue)
    else
        eve:FireServer(Player)
    end
end

--Don't do anything till the game is loaded
game.Loaded:Wait()

renderClicks()

RunService.RenderStepped:Connect(function()
    if clickMethod == "ground" then
        workspace.Ground.SimulatorObject.MouseClick:Connect(onClick)
    elseif clickMethod == "object" then
        for i,v in pairs(workspace.Objects:GetChildren()) do
            if v:FindFirstChild("SimulatorObject") then
                if v:GetAttribute("ClickValue") then
                    v.SimulatorObject.MouseClick:Connect(onClick,v:GetAttribute("ClickValue"))
                else
                    v.SimulatorObject.MouseClick:Connect(onClick)
                end
            end
        end
    elseif clickMethod == "iframe" then
        PlayerGui.SimulatorObjectParent.SimulatorObject.MouseButton1Click:Connect(onClick)
    end
end)