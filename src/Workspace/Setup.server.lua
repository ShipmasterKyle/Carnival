--[[
    © ShipmasterKyle (Drgametime3d) 2022
    You paid good money for this right?
    Then why are you sharing it?
    Don't redistrubute this code.
    Thank you!
]]

print("Starting Setup")
warn([[
© ShipmasterKyle (Drgametime3d) 2022
You paid good money for this right?
Then why are you sharing it?
Don't redistrubute this code.
Thank you!
]])

if game.StarterGui.ShowDevelopmentUI == false then
    error("Unable to contact DevelopmentUI. Please Enabled UI to continue.")
end

local newInstance = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local label = Instance.new("TextLabel")

newInstance.Parent = game.StarterGui
frame.Size = UDim2.new(1,0,1,0)
frame.Parent = newInstance

local setUpText = "Welcome to the Carnival Framework!"
local Instruct1 = "This is an interactive Framework Setup Menu. It makes setting up this framework very easy. To start please press begin."
local nextButtonText = "Button"

local method = "What Simulator ClickMethod will you use? (You can change this later by running this again)"

local groundDesc = "The ground method is very basic. Theres a single part on the ground. Clicking any part of it will earn you clicks."
local objectDesc = "The object method is the most common method. Any BasePart object (Unions, MeshParts, Parts etc) in a folder is marked as clickable. This usually requires a generation script. Also can have click value."
local iframeDesc = "The iframe method is the easiest to setup. An invisible gui is "

local setUpMenu = label:Clone()
setUpMenu.Size = UDim2.new(1,0,0.125,0)
setUpMenu.Font = Enum.Font.GothamSemibold
setUpMenu.TextScaled = true
setUpMenu.BackgroundTransparency = 1
setUpMenu.TextColor = Color3.fromHEX("#ffffff")
setUpMenu.Parent = frame
setUpMenu.Text = setUpText
local instruct = label:Clone()
instruct.Size(0.5,0,0.5,0)
instruct.AnchorPoint = Vector2.new(0.5,0.5)
instruct.Position = UDim2.new(0.5,0,0.5,0)
instruct.Text = Instruct1
instruct.Parent = frame
wait(1)
local nextButton = Button:Clone()
nextButton.Name = "Next"
nextButton.Text = Button
nextButton.AnchorPoint = Vector2.new(0.5,0.5)
nextButton.Position = UDim2.new(0.5,0,0.8,0)
nextButton.Parent = frame

frame.Next.MouseButton1Click:Connect(function()
    frame:ClearAllChildren()
    
end)