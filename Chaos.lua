-- Made by dauser#0133

local config = {
	['RapidShootKeybind'] = Enum.KeyCode.V
}

local starttick = tick()

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local TitleCorner = Instance.new("UICorner")
local MainCorner = Instance.new("UICorner")
local Container = Instance.new("Frame")
local ContainerGrid = Instance.new("UIGridLayout")
local ChoiceMenu = Instance.new("Frame")
local ChoiceFrame = Instance.new("Frame")
local ChoiceOff = Instance.new("TextButton")
local ChoiceOn = Instance.new("TextButton")
local ChoiceList = Instance.new("UIListLayout")
local ChoiceCorner = Instance.new("UICorner")
local ChoiceTextButton = Instance.new("TextButton")
local FunctionButton = Instance.new("TextButton")
local ButtonCorner = Instance.new("UICorner")

ScreenGui.Parent = game:GetService('CoreGui')
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.Position = UDim2.new(0.517283201, 0, 0.177478567, 0)
Main.Size = UDim2.new(0, 500, 0, 260)
Main.Image = "rbxassetid://9856552879"
Main.ImageTransparency = 0.700
Main.Draggable = true
Main.Active = true

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.Ubuntu
Title.RichText = true
Title.Text = "<font color=\"#FF0000\">S</font>wag<font color=\"#FF0000\">W</font>orks <font size=\"15\">Free Edition</font>"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 30.000

TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Name = "TitleCorner"
TitleCorner.Parent = Title

MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

Container.Name = "Container"
Container.Parent = Main
Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Container.BackgroundTransparency = 1.000
Container.ClipsDescendants = false
Container.Position = UDim2.new(0, 10, 0, 50)
Container.Size = UDim2.new(1, -20, 1, -60)

ContainerGrid.Name = "ContainerGrid"
ContainerGrid.Parent = Container
ContainerGrid.SortOrder = Enum.SortOrder.LayoutOrder
ContainerGrid.CellPadding = UDim2.new(0, 15, 0, 25)
ContainerGrid.CellSize = UDim2.new(0, 150, 0, 45)

ChoiceMenu.Name = "ChoiceMenu"
ChoiceMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ChoiceMenu.Size = UDim2.new(0, 100, 0, 100)
ChoiceMenu.ZIndex = 20

ChoiceFrame.Name = "ChoiceFrame"
ChoiceFrame.Parent = ChoiceMenu
ChoiceFrame.BackgroundTransparency = 0.25
ChoiceFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ChoiceFrame.BorderSizePixel = 0
ChoiceFrame.Position = UDim2.new(0, 0, 1, -7)
ChoiceFrame.Size = UDim2.new(1, 0, 0, 0)
ChoiceFrame.ZIndex = 99
ChoiceFrame.AutomaticSize = Enum.AutomaticSize.Y
ChoiceFrame.Visible = false

ChoiceOff.Name = "ChoiceOff"
ChoiceOff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChoiceOff.BackgroundTransparency = 1.000
ChoiceOff.Size = UDim2.new(1, 0, 0, 20)
ChoiceOff.Font = Enum.Font.SourceSans
ChoiceOff.Text = "ChoiceOff"
ChoiceOff.TextColor3 = Color3.fromRGB(255, 130, 132)
ChoiceOff.TextSize = 19.000
ChoiceOff.RichText = true
ChoiceMenu.AutomaticSize = Enum.AutomaticSize.X


local chcenabled = Color3.fromRGB(143, 255, 152)
local chcdisabled = Color3.fromRGB(255, 130, 132)

ChoiceList.Name = "ChoiceList"
ChoiceList.Parent = ChoiceFrame
ChoiceList.SortOrder = Enum.SortOrder.LayoutOrder

ChoiceCorner.CornerRadius = UDim.new(0, 7)
ChoiceCorner.Name = "ChoiceCorner"
ChoiceCorner.Parent = ChoiceMenu

ChoiceTextButton.Parent = ChoiceMenu
ChoiceTextButton.Name = 'Button'
ChoiceTextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ChoiceTextButton.BackgroundTransparency = 1.000
ChoiceTextButton.Size = UDim2.new(1, 0, 1, 0)
ChoiceTextButton.Font = Enum.Font.SourceSans
ChoiceTextButton.Text = "Multiple Choices"
ChoiceTextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChoiceTextButton.TextSize = 25.000

FunctionButton.Name = "FunctionButton"
FunctionButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FunctionButton.Size = UDim2.new(0, 200, 0, 50)
FunctionButton.AutoButtonColor = false
FunctionButton.Font = Enum.Font.SourceSans
FunctionButton.Text = "FunctionButton"
FunctionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FunctionButton.TextSize = 25.000
FunctionButton.TextWrapped = true

ButtonCorner.CornerRadius = UDim.new(0, 7)
ButtonCorner.Name = "ButtonCorner"
ButtonCorner.Parent = FunctionButton

--FunctionButton ChoiceMenu

function addbutton()
	local thebutton = FunctionButton:Clone()
	thebutton.Parent = Container
	return thebutton
end

function plrchoiceframe(text, tbl)
	local frm = ChoiceMenu:Clone()
	frm.Parent = Container
	frm.Button.MouseButton1Click:Connect(function()
		frm.ChoiceFrame.Visible = not frm.ChoiceFrame.Visible
	end)
	frm.Button.Text = text
	local buttons = {}
	local function handleplr(trg)
		if trg == game:GetService('Players').LocalPlayer then
			return
		end
		local inst = ChoiceOff:Clone()
		inst.Text = trg.DisplayName..' <font size="10">(@'..trg.Name..')</font>'
		inst.Parent = frm.ChoiceFrame
		inst.MouseButton1Click:Connect(function()
			if table.find(tbl, trg.UserId) then
				for i, b in pairs(tbl) do
					if b == trg.UserId then
						table.remove(tbl, i)
						inst.TextColor3 = chcdisabled
					end
				end
			else
				table.insert(tbl, trg.UserId)
				inst.TextColor3 = chcenabled
			end
		end)
		if table.find(tbl, trg.UserId) then
			for i, b in pairs(tbl) do
				if b == trg.UserId then
					inst.TextColor3 = chcenabled
				end
			end
		end
		buttons[trg.UserId] = inst
		trg.Destroying:Connect(function()
			inst:Destroy()
		end)
	end
	for i, v in pairs(game:GetService('Players'):GetPlayers()) do
		handleplr(v)
	end
	game:GetService('Players').PlayerAdded:Connect(function(trg)
		handleplr(trg)
	end)
	game:GetService('Players').PlayerRemoving:Connect(function(trg)
		if buttons[trg.UserId] then
			buttons[trg.UserId]:Destroy()
		end
	end)
	return frm
end

--[[]]
--Variables
--[[]]

local plrs = game:GetService('Players')
local plr = plrs.LocalPlayer

--[[]]
--Functions
--[[]]

function notify(text, dur)
	if tonumber(dur) == nil then
		dur = #text/3
	end
	game:GetService('StarterGui'):SetCore('SendNotification', {
		Title = 'SwagWorks',
		Text = text,
		Duration = dur,
		Button1 = 'Close'
	})
end

function addcd(tool, timetocd)
	if tonumber(timetocd) == nil then
		timetocd = 2
	end
	local cd = Instance.new('BoolValue', tool)
	cd.Name = 'CD'
	game:GetService('Debris'):AddItem(cd, timetocd)
end

function checkforcd(weapon)
	if weapon:FindFirstChild('CD') then
		return true
	else
		return false
	end
end

local melees = {'Mace', 'Emerald Greatsword', 'Blood dagger', 'Pencil', 'Chainsaw'}

local notifcd1 = false

function getmelees(amount, addcd)
	local tbl = {}
	for i, v in pairs(plr.Backpack:GetChildren()) do
		local iscd = checkforcd(v)
		if iscd == false and table.find(melees, v.Name) then
			table.insert(tbl, v)
			if addcd == true then
				addcd(v)
			end
			if #tbl >= amount then
				return tbl
			end
		end
	end
	if #tbl < amount then
		if notifcd1 == false then
			notify('Not enough tools', 5)
			notifcd1 = true
			task.spawn(function()
				task.wait(5)
				notifcd1 = false
			end)
		end
		return 'error'
	end
end

function killplr(target)
	local weapons = getmelees(3, addcd)
	if weapons ~= nil and weapons ~= 'error' and plr.Character and plr.Character:FindFirstChild('Humanoid') then
		local lasttool = nil
		if plr.Character:FindFirstChildOfClass('Tool') then
			lasttool = plr.Character:FindFirstChildOfClass('Tool')
			lasttool.Parent = plr.Backpack
		end
		for i, v in pairs(weapons) do
			for i, b in pairs(v:GetDescendants()) do
				if b:IsA('RemoteEvent') then
					v.Parent = plr.Character
					game:GetService('RunService').Heartbeat:Wait()
					b:FireServer(target.Character.Humanoid)
					v.Parent = plr.Backpack
				end
			end
		end
		game:GetService('RunService').Heartbeat:Wait()
		if lasttool ~= nil then
			plr.Character.Humanoid:EquipTool(lasttool)
		end
	end
end

local weapons = {}
for i, v in pairs(game:GetService('ReplicatedStorage').Weapons:GetChildren()) do
	table.insert(weapons, v.Name)
end

function dupetools(toolname)
	if toolname == nil then
		toolname = weapons[math.random(1, #weapons)]
	end
	local char = plr.Character
	if char and char:FindFirstChild('HumanoidRootPart') then
		if char:FindFirstChild('Loaded') then
			char.Loaded:Destroy()
			game:GetService('RunService').Heartbeat:Wait()
		end
		for i, v in pairs(plr.PlayerGui:GetDescendants()) do
			if v:IsA('RemoteEvent') and v.Name == 'RemoteEvent' then
				v:FireServer(toolname)
			end
		end
	end
end

function godmode()
	if plr.Character and plr.Character.Name == 'GoddedChar%' then
		notify('Already godded')
	else
		for _,v in next,plr.PlayerGui:GetChildren() do
			if v:IsA'ScreenGui' and v.Name ~= 'Chat' and v.Name ~= 'BubbleChat' then
				v.ResetOnSpawn = false
				spawn(function()
					wait(5)
					plr.CharacterAdded:wait()
					if v then
						v:Destroy()
					end
				end)
			elseif v:IsA'LocalScript' then
				v.Parent = plr
				spawn(function()
					wait(5)
					v.Parent = plr.PlayerGui
				end)
			end
		end
		if plr.Character and plr.Character:FindFirstChildOfClass'Humanoid' then
			if plr.Character:FindFirstChild'Ragdolled' and plr.Character.Ragdolled:FindFirstChildOfClass'Script' then
				plr.Character.Ragdolled:FindFirstChildOfClass'Script':Destroy()
			end
			if plr.Character:FindFirstChild('Being Carried') then
				plr.Character['Being Carried']:Destroy()
			end
			local char = plr.Character
			char.Animate.Disabled = true
			char.Archivable = true
			local new = char:Clone()
			new.Parent = workspace
			plr.Character = new
			wait(2)
			local oldhum = char:FindFirstChildOfClass'Humanoid'
			local newhum = oldhum:Clone()
			newhum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			newhum.Parent = char
			newhum.RequiresNeck = false
			oldhum.Parent = nil
			wait(2)
			plr.Character = char
			new:Destroy()
			wait(1)
			newhum:GetPropertyChangedSignal('Health'):Connect(function()
				if newhum.Health <= 0 then
					oldhum.Parent = plr.Character
					wait(1)
					oldhum:Destroy()
				end
			end)
			char.Animate.Disabled = false
			workspace.CurrentCamera.CameraSubject = char
		end
	end
end

function serverCrash()
	local amt = 0
	for i, v in pairs(plr.Backpack:GetChildren()) do
		if v.Name == 'C4' then
			amt += 1
		end
	end
	if amt >= 250 then
		notify('Crashing the server...')
		local dww = 0
		for i, v in pairs(plr.Backpack:GetChildren()) do
			if dww >= 250 then
				return
			end
			if v.Name == 'C4' then
				dww += 1
				v.Parent = plr.Character
				v.RemoteEvent:FireServer()
			end
		end
	else
		notify('Not enough C4, starting to dupe.')
		repeat
			dupetools() amt += 1 task.wait(0.01)
		until amt >= 250
		local dww = 0
		for i, v in pairs(plr.Backpack:GetChildren()) do
			if dww >= 250 then
				return
			end
			if v.Name == 'C4' then
				dww += 1
				v.Parent = plr.Character
				v.RemoteEvent:FireServer()
			end
		end
	end
end

local keybindss = false

function toggleKeybinds(button)
	keybindss = not keybindss
	if keybindss == true then
		button.Text = 'Keybinds [ON]'
	else
		button.Text = 'Keybinds [OFF]'
	end
end

--[[]]
--Buttons
--[[]]

local dpbutton = addbutton()
local duping = false
dpbutton.Text = 'Dupe [OFF]'
dpbutton.MouseButton1Click:Connect(function()
	if duping == false then
		duping = true
		dpbutton.Text = 'Dupe [ON]'
	else
		duping = false
		dpbutton.Text = 'Dupe [OFF]'
	end
end)

local lklist = {}
local loopkills = plrchoiceframe('Loopkill...', lklist)

local clearbp = addbutton()
clearbp.Text = 'Clear Inv'
clearbp.MouseButton1Click:Connect(function()
	for i, v in pairs(plr.Backpack:GetChildren()) do
		v:Destroy()
		task.wait(0.001)
	end
end)

local godbutton = addbutton()
godbutton.Text = 'GodMode'
godbutton.MouseButton1Click:Connect(function()
	godmode()
end)

local crashButton = addbutton()
crashButton.Text = 'Crash'
crashButton.MouseButton1Click:Connect(function()
	serverCrash()
end)

local keybindsButtons = addbutton()
keybindsButtons.Text = 'Keybinds [OFF]'
keybindsButtons.MouseButton1Click:Connect(function()
	toggleKeybinds(keybindsButtons)
end)


--[[]]
--CoreLoops & Functions
--[[]]

task.spawn(function()
	while true do
		if #lklist > 0 then
			for i, v in pairs(plrs:GetChildren()) do
				if v and table.find(lklist, v.UserId) and v.Character and v.Character:FindFirstChild('Humanoid') and v.Character.Humanoid.Health > 0 then
					if v.Character:FindFirstChild('ForceField') then else
						killplr(v)
					end
				end
			end
		end
		task.wait(0.075)
	end
end)

task.spawn(function()
	while true do
		if duping == true then
			dupetools()
		end
		task.wait(0.025)
	end
end)
	
local rShoot = false
local lasttool = nil
game:GetService('UserInputService').InputBegan:Connect(function(input, gp)
	if input.KeyCode == config.RapidShootKeybind and keybindss == true and gp == false then
		rShoot = true
		if plr.Character:FindFirstChildOfClass('Tool') then
			local tool = plr.Character:FindFirstChildOfClass('Tool')
			lasttool = tool
			tool.Parent = plr.Backpack
		end
	end
end)
game:GetService('UserInputService').InputEnded:Connect(function(input, gp)
	if input.KeyCode == config.RapidShootKeybind and gp == false then
		rShoot = false
		if lasttool ~= nil then
			lasttool = nil
			if plr.Character and plr.Character:FindFirstChild('Humanoid') then
				plr.Character.Humanoid:Equip(lasttool)
			end
		end
	end
end)

task.spawn(function()
	--Stoled from another script again
	local function Shoot(firstPos,nextPos,Revolver)
		if Revolver:FindFirstChild'Barrel' and Revolver.Barrel:FindFirstChild'Attachment' then
			if Revolver.Barrel.Attachment:FindFirstChild'Sound' then
				local SoundClone = Revolver.Barrel.Attachment.Sound:Clone()
				SoundClone.Name = 'Uncopy'
				SoundClone.Parent = Revolver.Barrel.Attachment
				SoundClone:Play()
				game.Debris:AddItem(SoundClone, 1)
			end
			local FilterTable = {}
			table.insert(FilterTable, plr.Character)
			table.insert(FilterTable, game.Workspace['Target Filter'])
			for _, v in pairs(game.Workspace:GetDescendants()) do
				if v.ClassName == 'Accessory' then
					table.insert(FilterTable, v)
				end
			end
			local a_1, a_2, a_3 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(firstPos, (nextPos - firstPos).Unit * 100), FilterTable)
			local BulletCl = game:GetService'ReplicatedStorage'['Revolver Bullet']:Clone()
			game.Debris:AddItem(BulletCl, 1)
			BulletCl.Parent = game.Workspace['Target Filter']
			local mg = (firstPos - a_2).Magnitude
			BulletCl.Size = Vector3.new(0.2, 0.2, mg)
			BulletCl.CFrame = CFrame.new(firstPos, nextPos) * CFrame.new(0, 0, -mg / 2)
			game:GetService('TweenService'):Create(BulletCl, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				Size = Vector3.new(0.05, 0.05, mg), 
				Transparency = 1
			}):Play()
			if a_1 then
				local expPart = Instance.new'Part'
				game.Debris:AddItem(expPart, 2)
				expPart.Name = 'Exploding Neon Part'
				expPart.Anchored = true
				expPart.CanCollide = false
				expPart.Shape = 'Ball'
				expPart.Material = Enum.Material.Neon
				expPart.BrickColor = BulletCl.BrickColor
				expPart.Size = Vector3.new(0.1, 0.1, 0.1)
				expPart.Parent = game.Workspace['Target Filter']
				expPart.Position = a_2
				game:GetService('TweenService'):Create(expPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					Size = Vector3.new(2, 2, 2), 
					Transparency = 1
				}):Play()
				if Revolver:FindFirstChild'DamageRemote' and a_1.Parent:FindFirstChild'Humanoid' then
					Revolver.DamageRemote:FireServer(a_1.Parent.Humanoid)
				end
			end
		end
	end
	local mouse = plr:GetMouse()
	while true do
		game:GetService('RunService').Heartbeat:Wait()
		if rShoot == true then
			for i, v in pairs(plr.Backpack:GetChildren()) do
				local iscd = checkforcd(v)
				if iscd == false and rShoot == true then
					if v.Name == 'Kawaii Revolver' then
						v.Parent = plr.Character
						game:GetService('RunService').Heartbeat:Wait()
						Shoot(plr.Character.Head.Position, mouse.Hit.Position, v)
						v.Parent = plr.Backpack
						addcd(v)
					end
				end
			end
		end
	end
end)

notify('Gui loaded in '..string.sub(tostring(tick()-starttick), 1, 6)..' seconds.')
