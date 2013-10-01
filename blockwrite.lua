-- blockwrite
-- Write text banners using minecraft blocks

-- Text height is 7 blocks
-- Initial position must be top left corner of text, facing downwards

-- Use with a mining turtle
-- Fuel it and fill with enough blocks to write the text

-- TODO: Remove global position if not used, or use for flattening, return-to-origin or newline?
-- TODO: Perhaps: variable incapsulation, for instance extend the turtle with positioning properties

-- Debug, toggle boolean to en-/disable
function D(msg) 
	if false then
		print(msg)
	end
end

local args = { ... }
if #args < 1 then
	error([[blockwrite.lua "text-to-write"]])
end

local thetext = string.upper(table.concat(args, " "))

function Line(x1, y1, x2, y2)
	v = {["x1"] = x1, ["y1"] = y1, ["x2"] = x2, ["y2"] = y2}
	v.toStr = function(self)
		return self.x1 .. "." .. self.y1 .. " -> " .. self.x2 .. "." .. self.y2
    end

    return v
end

local Text = {
	spaceWidth = 3,
	letterHeight = 7
}

local letters = {
	A = {
		 	Line(1,2 , 1,7),
			Line(4,7 , 4,2),
			Line(2,4 , 3,4),
    		Line(2,1 , 3,1),
    		width = 4
		},
	B = {
			Line(1,1 , 1,7),
			Line(2,7 , 3,7),
			Line(2,4 , 3,4),
			Line(2,1 , 3,1),
			Line(4,2 , 4,3),
			Line(4,5 , 4,6),
			width = 4
		},
	C = {
			Line(1,2 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,6),
			Line(2,1 , 3,1),
			Line(4,2 , 4,2),
			width = 4
	},
	D = {
			Line(1,1 , 1,7),
			Line(2,7 , 3,7),
			Line(4,6 , 4,2),
			Line(2,1 , 3,1),
			width = 4
	},
	E = {
			Line(1,1 , 1,7),
			Line(2,7 , 3,7),
			Line(2,4 , 3,4),
			Line(2,1 , 3,1),
			width = 3
	},
	F = {
			Line(1,1 , 1,7),
			Line(2,4 , 3,4),
			Line(2,1 , 3,1),
			width = 3
	},
	G = {
			Line(1,2 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,5),
			Line(3,5 , 3,5),
			Line(2,1 , 3,1),
			Line(4,2 , 4,2),
			width = 4
	},
	H = {
			Line(1,1 , 1,7),
			Line(2,4 , 3,4),
			Line(4,7 , 4,1),
			width = 4
	},
	I = {
			Line(1,1 , 1,7),
			width = 1
	},
	J = {
			Line(4,1 , 4,6),
			Line(3,7 , 2,7),
			Line(1,6 , 1,6),
			width = 4
	},
	K = {
			Line(1,1 , 1,7),
			Line(4,7 , 4,5),
			Line(3,4 , 2,3),
			Line(3,2 , 4,1),
			width = 4
	},
	L = {
			Line(1,1 , 1,7),
			Line(2,7 , 4,7),
			width = 4
	},
	M = {
			Line(1,1 , 1,7),
			Line(5,7 , 5,1),
			Line(2,2 , 2,2),
			Line(4,2 , 4,2),
			Line(3,3 , 3,4),
			width = 5
	},
	N = {
			Line(1,1 , 1,7),
			Line(2,3 , 4,5),
			Line(5,7 , 5,1),
			width = 5
	},
	O = {
			Line(1,2 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,2),
			Line(2,1 , 3,1),
			width = 4
	},
	P = {
			Line(1,1 , 1,7),
			Line(2,4 , 3,4),
			Line(2,1 , 3,1),
			Line(4,3 , 4,2),
			width = 4
	},
	Q = {
			Line(1,2 , 1,5),
			Line(2,6 , 3,6),
			Line(4,7 , 4,7),
			Line(4,6 , 4,2),
			Line(2,1 , 3,1),
			width = 4
	},
	R = {
			Line(1,1 , 1,7),
			Line(4,7 , 4,5),
			Line(2,4 , 3,4),
			Line(2,1 , 3,1),
			Line(4,3 , 4,2),
			width = 4
	},
	S = {
			Line(1,2 , 1,3),
			Line(1,6 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,5),
			Line(3,4 , 2,4),
			Line(2,1 , 3,1),
			Line(4,2 , 4,2),
			width = 4
	},
	T = {
			Line(3,7 , 3,2),
			Line(1,1 , 5,1),
			width = 5
	},
	U = {
			Line(1,1 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,1),
			width = 4
	},
	V = {
			Line(1,1 , 1,4),
			Line(2,5 , 2,6),
			Line(3,7 , 3,7),
			Line(4,6 , 4,5),
			Line(5,4 , 5,1),
			width = 5
	},
	W = {
			Line(1,1 , 1,6),
			Line(2,7 , 2,7),
			Line(3,6 , 3,5),
			Line(4,7 , 4,7),
			Line(5,6 , 5,1),
			width = 5
	},
	X = {
			Line(1,1 , 1,2),
			Line(2,3 , 4,5),
			Line(5,6 , 5,7),
			Line(1,7 , 1,6),
			Line(2,5 , 2,5),
			Line(4,3 , 4,3),
			Line(5,2 , 5,1),
			width = 5
	},
	Y = {
			Line(1,1 , 3,3),
			Line(3,4 , 3,7),
			Line(4,2 , 5,1),
			width = 5
	},
	Z = {
			Line(1,1 , 4,1),
			Line(4,2 , 1,5),
			Line(1,6 , 1,7),
			Line(2,7 , 4,7),
			width = 4
	},
	["Å"] = {
			Line(1,4 , 1,7),
			Line(2,5 , 3,5),
			Line(4,7 , 4,4),
			Line(3,3 , 2,3),
			Line(2,1 , 3,1),
			width = 4
	},
	["Ä"] = {
			Line(1,4 , 1,7),
			Line(2,5 , 3,5),
			Line(4,7 , 4,4),
			Line(3,3 , 2,3),
			Line(1,1 , 1,1),
			Line(4,1 , 4,1),
			width = 4
	},
	["Ö"] = {
			Line(1,4 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,4),
			Line(3,3 , 2,3),
			Line(1,1 , 1,1),
			Line(4,1 , 4,1),
			width = 4
	},
	["0"] = {
			Line(1,2 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,2),
			Line(3,1 , 2,1),
			Line(2,4 , 3,3),
			width = 4
	},
	["1"] = {
			Line(3,1 , 3,7),
			Line(2,1 , 1,2),
			width = 3
	},
	["2"] = {
			Line(1,2 , 2,1),
			Line(3,1 , 4,2),
			Line(4,3 , 1,6),
			Line(1,7 , 4,7),
			width = 4
	},
	["3"] = {
			Line(1,2 , 2,1),
			Line(3,1 , 4,2),
			Line(4,3 , 3,4),
			Line(4,5 , 4,6),
			Line(3,7 , 2,7),
			Line(1,6 , 1,6),
			width = 4
	},
	["4"] = {
			Line(1,1 , 1,4),
			Line(2,4 , 3,4),
			Line(4,7 , 4,1),
			width = 4
	},
	["5"] = {
			Line(1,1 , 1,3),
			Line(2,4 , 3,4),
			Line(4,5 , 4,6),
			Line(3,7 , 2,7),
			Line(1,6 , 1,6),
			Line(2,1 , 4,1),
			width = 4
	},
	["6"] = {
			Line(1,2 , 2,1),
			Line(3,1 , 4,2),
			Line(4,3 , 4,6),
			Line(3,7 , 2,7),
			Line(1,6 , 1,5),
			Line(2,4 , 3,4),
			width = 4
	},
	["7"] = {
			Line(1,1 , 4,1),
			Line(4,2 , 4,3),
			Line(3,4 , 3,5),
			Line(2,6 , 2,7),
			width = 4
	},
	["8"] = {
			Line(1,2 , 2,1),
			Line(3,1 , 4,2),
			Line(4,3 , 3,4),
			Line(2,4 , 1,3),
			Line(1,5 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,5),
			width = 4
	},
	["9"] = {
			Line(1,2 , 2,1),
			Line(3,1 , 4,2),
			Line(4,3 , 3,4),
			Line(2,4 , 1,3),
			Line(1,6 , 1,6),
			Line(2,7 , 3,7),
			Line(4,6 , 4,4),
			width = 4
	},
	["!"] = {
			Line(1,1 , 1,5),
			Line(1,7 , 1,7),
			width = 1
	}

}

local directionNames = {"North", "East", "South", "West"}
local North, East, South, West = 1, 2, 3, 4
local xPos, yPos, localXPos, localYPos, letterNum = 1, 1, 1, 1, 1
local currentDirection = South
local currentSlot = 1

function face(newDirection)
	if newDirection == currentDirection then return end
	if newDirection == currentDirection - 1 then turtle.turnLeft() end
	if newDirection == currentDirection + 1 then turtle.turnRight() end
	if math.abs(newDirection - currentDirection) == 2 then turtle.turnRight(); turtle.turnRight() end
	if currentDirection == North and newDirection == West then turtle.turnLeft() end
	if currentDirection == West and newDirection == North then turtle.turnRight() end
	currentDirection = newDirection
end

function goForward()
	if not turtle.forward() then
		error("Cannot go forward - surface not level?")
	end

	if currentDirection == North then yPos = yPos - 1; localYPos = localYPos - 1 end
	if currentDirection == South then yPos = yPos + 1; localYPos = localYPos + 1 end
	if currentDirection == West  then xPos = xPos - 1; localXPos = localXPos - 1 end
	if currentDirection == East  then xPos = xPos + 1; localXPos = localXPos + 1 end
end

function goLocal(x, y)
	D("Going to " .. x .. "." .. y .." from " .. localXPos .. "." .. localYPos)

	if x ~= localXPos then
		if x < localXPos then face(West) else face(East) end
		while math.abs(x - localXPos) ~= 0 do goForward() end
	end
	if y ~= localYPos then
		if y < localYPos then face(North) else face(South) end
		while math.abs(y - localYPos) ~= 0 do goForward() end
	end
end

function resetPosition()
	localYPos, localXPos = 1, 1
end

function armSlot() 
	turtle.select(currentSlot)

	if turtle.getItemCount(currentSlot) < 1 then
		for currentSlot=1,16 do
			turtle.select(currentSlot)
			if turtle.getItemCount(currentSlot) > 0 then return end
		end

		error("No blocks left!")
	end
end

function putBlock()
	D("Putting block at " .. localXPos .. "." .. localYPos)

	if turtle.detectDown() then
		if not turtle.digDown() then
			error("Cannot dig down!")
		end
	end

	armSlot()

	if not turtle.placeDown() then
		error("Cannot place block - surface not level?")
	end
end

-- write a diagonal at 45 degrees, cannot handle other angles, ie delta x and delta y must be equal
function writeDiagonalTo(x, y)
	xstep = localXPos > x and -1 or 1
	ystep = localYPos > y and -1 or 1
	_x, _y = localXPos, localYPos

	for i=1, math.abs(localXPos - x) + 1 do
		goLocal(_x, _y)
		putBlock()
		_x = _x + xstep
		_y = _y + ystep
	end
end

-- straight lines along x or y axis
function writeStraightTo(x, y)
	for _x=localXPos,x,localXPos > x and -1 or 1 do
		for _y=localYPos,y,localYPos > y and -1 or 1 do
			goLocal(_x, _y)
			putBlock()
		end
	end
end

function writeTo(x, y)
	if math.abs(localXPos - x) == math.abs(localYPos - y) then
		writeDiagonalTo(x, y)
	else
		writeStraightTo(x, y)
	end
end

function writeLetter(lines)
	for i, Line in ipairs(lines) do
		D("Starting Line " .. Line:toStr())
		goLocal(Line.x1, Line.y1)
		writeTo(Line.x2, Line.y2)
	end
end

-- TODO: Initially check enough material?
local totalLength = 0
for c in thetext:gmatch(".") do
	if letters[c] then
		totalLength = totalLength + letters[c].width + 1
	end
end
totalLength = totalLength - 1

print(thetext .. " requires " .. totalLength .. " x " .. Text.letterHeight .. " blocks flat space!")

-- TODO: Initially level entire surface?

-- Go to initial position, ie suspended one block up
while turtle.down() do end
if not turtle.up() then error("Cannot go up!") end

-- Write the text
for c in thetext:gmatch(".") do
	if letters[c] then
		D("Writing letter ".. c)
		writeLetter(letters[c])
		goLocal(letters[c].width + 2, 1)
		resetPosition()
		face(South)
	end

	if c == " " then
		goLocal(Text.spaceWidth, 1)
		resetPosition()
		face(South)
	end
end

