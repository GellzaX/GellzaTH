-- [[ GellzaX V.2 - FIX VERSION ]] --
-- [[ ขาว-ฟ้า | สายฟ้าเหลือง | รันติดชัวร์ ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = Library:MakeWindow({Name = "⚡ GellzaX Hub | Muscle Legends ⚡", HidePremium = false, SaveConfig = true, ConfigFolder = "GellzaX", IntroText = "GellzaX Hub V.2"})

-- [[ 1. หมวดฟาร์ม ]] --
local FarmTab = Window:MakeTab({
	Name = "ฟาร์ม ⚡",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

getgenv().AutoFarm = false
FarmTab:AddToggle({
	Name = "เริ่มฟาร์ม (Auto Farm All)",
	Default = false,
	Callback = function(Value)
		getgenv().AutoFarm = Value
        if Value then
            spawn(function()
                while getgenv().AutoFarm do
                    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then tool:Activate() end
                    
                    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("muscleEvent") or 
                                   game:GetService("ReplicatedStorage"):FindFirstChild("punchClick")
                    if remote then remote:FireServer("punchClick") end
                    task.wait(0.05)
                end
            end)
        end
	end    
})

-- [[ 2. หมวดรีเบิด ]] --
local RebirthTab = Window:MakeTab({
	Name = "รีเบิด ⚡",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

getgenv().KingRoom = false
RebirthTab:AddToggle({
	Name = "ล็อคห้องคิง (Rebirth 5)",
	Default = false,
	Callback = function(Value)
		getgenv().KingRoom = Value
        if Value then
            spawn(function()
                while getgenv().KingRoom do
                    local char = game.Players.LocalPlayer.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    local kingPos = CFrame.new(-2536, 13, -425)
                    if root and (root.Position - kingPos.p).Magnitude > 35 then
                        root.CFrame = kingPos
                    end
                    task.wait(0.7)
                end
            end)
        end
	end    
})

-- [[ 3. ปุ่มเปิด-ปิดสำหรับมือถือ (สายฟ้าเหลือง) ]] --
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Position = UDim2.new(0.1, 0, 0.2, 0)
ImageButton.Image = "rbxassetid://6031064398" -- สายฟ้า
ImageButton.ImageColor3 = Color3.fromRGB(255, 220, 0) -- สีเหลือง
ImageButton.Draggable = true
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = ImageButton

ImageButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end)

Library:Init()
