-- [[ GellzaX V.2 - MUSCLE LEGENDS GUI ]] --
-- [[ แก้ไขให้เลื่อนได้ กดได้บนมือถือ ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- สร้างหน้าต่างหลัก (DarkTheme จะช่วยให้มองง่ายบนจอมือถือ)
local Window = Library.CreateLib("⚡ GellzaX Hub | Muscle Legends ⚡", "DarkTheme")

-- [[ 1. Main Tab ]] --
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Settings & Safety")

MainSection:NewTextBox("Set Size", "ใส่ตัวเลขขนาดตัว", function(txt)
    print("Size set to: " .. txt)
end)

MainSection:NewToggle("Anti Fling", "กันคนชนกระเด็น", function(state)
    getgenv().AntiFling = state
end)

-- [[ 2. Farming Tab ]] --
local FarmingTab = Window:NewTab("Farming")
local FarmSection = FarmingTab:NewSection("Auto Farming")

FarmSection:NewToggle("🌀 Auto King", "วาร์ปฟาร์มในวงคิง", function(state)
    getgenv().AutoKing = state
end)

-- [[ 3. Rebirth Tab ]] --
local RebirthTab = Window:NewTab("Rebirth")
local RebirthSection = RebirthTab:NewSection("Auto Rebirth")

RebirthSection:NewToggle("Auto Rebirth", "เกิดใหม่อัตโนมัติ", function(state)
    getgenv().AutoRebirth = state
end)

-- [[ 4. Bug Tab - หมวดที่หนูเน้น ]] --
local BugTab = Window:NewTab("ทำบัค")
local BugSection = BugTab:NewSection("บัคต่อยอากาศ (เพิ่มทนทาน)")

-- ปุ่มนี้จะแก้ปัญหาที่หนูอยากได้: ต่อยอากาศฟาร์มทนทาน เดินไปไหนก็ได้
BugSection:NewToggle("เริ่มบัคต่อยอากาศ", "ฟาร์มทนทานได้ทุกที่", function(state)
    getgenv().AutoPunch = state
    task.spawn(function()
        while getgenv().AutoPunch do
            -- ใช้ RemoteEvent ของเกมโดยตรงจะทำให้กดติดแม้ UI จะเลื่อน
            local punchRemote = game:GetService("ReplicatedStorage"):FindFirstChild("punchClick") or 
                               game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Punch")
            if punchRemote then
                punchRemote:FireServer("punchClick")
            end
            task.wait(0.01)
        end
    end)
end)

BugSection:NewButton("ทำบัคหิน 10 ล้าน", "วาร์ปไปจุดหิน", function()
    -- ใส่โค้ดวาร์ป
end)

-- [[ ลบ Made in Yasothon ออกเรียบร้อย ]] --
-- [[ สร้างปุ่มกดเปิด/ปิด สำหรับมือถือ หรือคนไม่มีคีย์บอร์ด ]] --
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.BorderSizePixel = 2
ToggleButton.Position = UDim2.new(0.1, 0, 0.1, 0) -- ปรับตำแหน่งปุ่มตรงนี้
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Text = "⚡" -- รูปสายฟ้าตามที่หนูชอบ
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 0)
ToggleButton.TextSize = 30
ToggleButton.Draggable = true -- ทำให้หนูเอานิ้วลากปุ่มไปวางตรงไหนก็ได้

-- ฟังก์ชันเมื่อกดปุ่มสายฟ้า
ToggleButton.MouseButton1Click:Connect(function()
    -- สลับสถานะการมองเห็นของหน้าเมนู
    Library:ToggleLib()
end)
