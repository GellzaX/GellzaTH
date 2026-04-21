-- [[ GellzaX V.2 - THE ULTIMATE WHITE-BLUE ⚡ EDITION ]] --
-- [[ สไตล์ Silence | ขาว-ฟ้า | สายฟ้าเหลือง | ปิดได้จริง | ลากได้ ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- [[ 1. หัวข้อสคริปต์ (สายฟ้าสีเหลือง ⚡) ]] --
local Window = Library.CreateLib("<font color='#FFFF00'>⚡</font> GellzaX Hub | Muscle Legends <font color='#FFFF00'>⚡</font>", "Light")

-- [[ 2. ตั้งค่าหน้า Tab ทั้งหมด ]] --
local MainTab = Window:NewTab("หน้าหลัก")
local FarmingTab = Window:NewTab("ฟาร์ม")
local RebirthTab = Window:NewTab("รีเบิด")
local BugTab = Window:NewTab("ทำบัค")

-- ==========================================
-- [[ ระบบปุ่มสายฟ้า (สีเหลือง + ขาวฟ้า + ลากได้) ]] --
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

ScreenGui.Parent = game.CoreGui
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- พื้นหลังขาว
ImageButton.Size = UDim2.new(0, 60, 0, 60)
ImageButton.Position = UDim2.new(0.1, 0, 0.2, 0)
ImageButton.Image = "rbxassetid://6031064398" -- รูปสายฟ้า
ImageButton.ImageColor3 = Color3.fromRGB(255, 220, 0) -- สายฟ้าสีเหลือง ⚡
ImageButton.Draggable = true 

UIStroke.Parent = ImageButton
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(0, 170, 255) -- ขอบสีฟ้าสว่าง
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = ImageButton

-- ฟังก์ชัน ย่อ/ขยาย (กดที่สายฟ้าแล้วเหลือแต่แถบฟ้าขาวด้านบนที่ลากได้)
ImageButton.MouseButton1Click:Connect(function()
    Library:ToggleLib()
end)

-- ==========================================
-- [[ 1. หมวด หน้าหลัก (ระบบป้องกัน) ]] --
-- ==========================================
local MainSection = MainTab:NewSection("ตั้งค่าตัวละคร")
getgenv().AntiFling = false

MainSection:NewToggle("กันคนชน (Anti-Fling)", "เปิดไว้ไม่กระเด็นเวลาคนชน", function(state)
    getgenv().AntiFling = state
    if state then
        task.spawn(function()
            while getgenv().AntiFling do
                local char = game.Players.LocalPlayer.Character
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- ==========================================
-- [[ 2. หมวด ฟาร์ม (ปิดได้จริง 100%) ]] --
-- ==========================================
local FarmSection = FarmingTab:NewSection("Auto Farm <font color='#FFFF00'>⚡</font>")
getgenv().AutoFarm = false

FarmSection:NewToggle("เริ่มฟาร์ม (Auto Farm)", "ฟาร์มรัวๆ ปิดได้ทันที", function(state)
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
local RebirthSection = RebirthTab:NewSection("ระบบรีเบิด <font color='#FFFF00'>⚡</font>")

getgenv().LockKingRoom = false
RebirthSection:NewToggle("ล็อคตำแหน่งห้องคิง", "วาร์ปกลับ Rebirth 5 อัตโนมัติ", function(state)
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
local BugSection = BugTab:NewSection("บัคทนทาน <font color='#FFFF00'>⚡</font>")
getgenv().BugPunch = false

BugSection:NewToggle("เริ่มบัคต่อยอากาศ", "เพิ่มค่าทนทานไวขึ้น (ปิดได้จริง)", function(state)
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
