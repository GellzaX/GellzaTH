-- [[ GellzaX V.2 - THE ULTIMATE FULL VERSION ]] --
-- [[ White-Blue Theme | Yellow Lightning | Delta Optimized ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- [[ 1. หัวข้อสคริปต์ (สายฟ้าสีเหลือง ⚡) ]] --
local Window = Library.CreateLib("⚡ GellzaX Hub | Muscle Legends ⚡", "Light")

-- [[ 2. สร้าง Tab ทั้งหมด ]] --
local MainTab = Window:NewTab("หน้าหลัก 🏠")
local FarmingTab = Window:NewTab("ฟาร์ม ⚡")
local RebirthTab = Window:NewTab("รีเบิด 🔄")
local BugTab = Window:NewTab("ทำบัค ⚙️")
local CreditTab = Window:NewTab("เครดิต ✨")

-- ==========================================
-- [[ 1. หมวด หน้าหลัก (ตั้งค่าตัวละคร) ]] --
-- ==========================================
local MainSection = MainTab:NewSection("Character Settings")

MainSection:NewSlider("ความเร็ว (WalkSpeed)", "ปรับความเร็วการเดิน", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("แรงกระโดด (JumpPower)", "ปรับความสูงการกระโดด", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- ==========================================
-- [[ 2. หมวด ฟาร์ม (ระบบ Silence - ปิดได้จริง) ]] --
-- ==========================================
local FarmSection = FarmingTab:NewSection("Auto Farming System")
getgenv().AutoFarm = false

FarmSection:NewToggle("Auto Farm (All)", "ฟาร์มกล้ามเนื้อรัวๆ 0.05s", function(state)
    getgenv().AutoFarm = state
    if state then
        task.spawn(function()
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
end)

-- ==========================================
-- [[ 3. หมวด รีเบิด (ห้องคิง + ขนาดตัว) ]] --
-- ==========================================
local RebirthSection = RebirthTab:NewSection("Rebirth & King Room")

getgenv().LockKingRoom = false
RebirthSection:NewToggle("ล็อคพิกัดห้องคิง (R5)", "วาร์ปกลับห้อง Rebirth 5 อัตโนมัติ", function(state)
    getgenv().LockKingRoom = state
    if state then
        task.spawn(function()
            while getgenv().LockKingRoom do
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
end)

getgenv().LockSize = false
RebirthSection:NewToggle("ล็อคขนาดตัว (ไซส์ 2)", "ตัวจิ๋วถาวรช่วยให้ฟาร์มง่าย", function(state)
    getgenv().LockSize = state
    if state then
        task.spawn(function()
            while getgenv().LockSize do
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SizeEvent")
                if remote then remote:FireServer("shrink", 2) end
                task.wait(1)
            end
        end)
    end
end)

-- ==========================================
-- [[ 4. หมวด ทำบัค (ต่อยอากาศ) ]] --
-- ==========================================
local BugSection = BugTab:NewSection("Durability Bug")
getgenv().BugPunch = false

BugSection:NewToggle("เริ่มบัคต่อยอากาศ", "เพิ่มค่าทนทานไวขึ้น", function(state)
    getgenv().BugPunch = state
    if state then
        task.spawn(function()
            while getgenv().BugPunch do
                local punchRemote = game:GetService("ReplicatedStorage"):FindFirstChild("punchClick")
                if punchRemote then punchRemote:FireServer("punchClick") end
                task.wait(0.05)
            end
        end)
    end
end)

-- ==========================================
-- [[ 5. หมวด เครดิต ]] --
-- ==========================================
local CreditSection = CreditTab:NewSection("เจ้าของสคริปต์: เกว (GellzaX)")
CreditSection:NewButton("เวอร์ชัน: 2.0 (White-Blue)", function()
    print("GellzaX V.2 is the best!")
end)

-- ==========================================
-- [[ ระบบปุ่มสายฟ้าเหลือง (Floating Button) ]] --
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

ScreenGui.Parent = game.CoreGui
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- พื้นหลังขาว
ImageButton.Size = UDim2.new(0, 55, 0, 55)
ImageButton.Position = UDim2.new(0.1, 0, 0.2, 0)
ImageButton.Image = "rbxassetid://6031064398" -- สายฟ้า
ImageButton.ImageColor3 = Color3.fromRGB(255, 220, 0) -- สีเหลือง ⚡
ImageButton.Draggable = true 

UIStroke.Parent = ImageButton
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(0, 170, 255) -- ขอบฟ้าสว่าง

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = ImageButton

ImageButton.MouseButton1Click:Connect(function()
    Library:ToggleLib() -- เปิด-ปิดเมนู
end)

print("⚡ GellzaX Hub Full Version Loaded! ⚡")

