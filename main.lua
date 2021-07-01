local move = script.Parent.MAINMOVE.Value
local val = script.Parent.MAINMOTORS.Value
local recline = val.RECLINE.Motor
local legrest = val.LEGREST.Motor
local val2 = script.Parent.SeatLoc.Value
local rec = val2.Recline
local bed = val2.Bed
wait() -- dont remove
print(rec.Value)
print(bed.Value)

local function disable()
	for i, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("TextButton") then
			v.Visible = false
		end
	end
end

local function enable()
	for i, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("TextButton") then
			wait(5)
			v.Visible = true
		end
	end
end

local function v2(req)
	if req == "bed" then
		disable()
		bed.Value = true
		move.TargetPosition = 3
		warn("bed dponmg")
		wait(3)
		recline.DesiredAngle = math.rad(-80)
		legrest.DesiredAngle = math.rad(-90)
		enable()
	elseif req == "nobed" then
		disable()
		bed.Value = false
		recline.DesiredAngle = 0
		legrest.DesiredAngle = 0
		wait(3.5)
		move.TargetPosition = 0
		enable()
	elseif req == "rec" then
		disable()
		rec.Value = true
		move.TargetPosition = 1.5
		wait(2)
		recline.DesiredAngle = math.rad(-25)
		legrest.DesiredAngle = math.rad(-25)
		enable()
	elseif req == "norec" then
		disable()
		rec.Value = false
		recline.DesiredAngle = 0
		legrest.DesiredAngle = 0
		wait(2)
		move.TargetPosition = 0
		enable()
	elseif req == "from rec to bed" then
		disable()
		rec.Value = false
		bed.Value = true
		move.TargetPosition = 3
		wait(3)
		recline.DesiredAngle = math.rad(-80)
		legrest.DesiredAngle = math.rad(-90)
		enable()
	elseif req == "from bed to rec" then
		disable()
		bed.Value = false
		rec.Value = true
		recline.DesiredAngle = math.rad(-25)
		legrest.DesiredAngle = math.rad(-25)
		wait(4)
		move.TargetPosition = 1.5
		enable()
	end
end

script.Parent.RECLINE.MouseButton1Click:Connect(function()
	if rec.Value == true then
		v2("norec")
	elseif rec.Value == false and bed.Value == false then
		v2("rec")
	elseif rec.Value == false and bed.Value == true then
		v2("from bed to rec")
	end
end)

script.Parent.BED.MouseButton1Click:Connect(function()
	if bed.Value == true then
		v2("nobed")
	elseif bed.Value == false then
		warn("bed")
		v2("bed")
	elseif bed.Value == false and rec.Value == true then
		v2("from rec to bed")
	end
end)
