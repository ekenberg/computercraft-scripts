-- Use with a mining turtle
-- Fuel it and load enough material to build the flat area

local usage = [[makeflat.lua x y
 make a flat area x times y blocks
 x = forward, y = right
 ie to make this:
   ######
   ######
   ######
 you would place the turtle in the top left corner, facing right, then: makeflat.lua 6 3]]

local args = { ... }
if #args ~= 2 then
	error(usage)
end

local z = 0 -- up/down, > 0 is upwards
args.x = tonumber(args[1])
args.y = tonumber(args[2])

-- Extend turtle:
turtle.currentSlot = 1

turtle.armSlot = function(self)
	self.select(self.currentSlot)

	if self.getItemCount(self.currentSlot) < 1 then
		for i=self.currentSlot,16 do
			self.currentSlot = i
			self.select(self.currentSlot)
			if self.getItemCount(self.currentSlot) > 0 then return end
		end

		error("No blocks left!")
	end
end

turtle.putBlock = function(self)
	if self.detectDown() then
		if not self.digDown() then
			error("Cannot dig down!")
		end
	end

	self:armSlot()

	if not self.placeDown() then
		error("Cannot place block!")
	end
end

turtle.clearForward = function(self)
	while turtle.detect()   do if not turtle.dig()   then error("Cannot dig!") end;    sleep(0.5) end 
	while turtle.detectUp() do if not turtle.digUp() then error("Cannot dig up!") end; sleep(0.5) end 
	if not turtle.forward() then error("Cannot move!") end
	while turtle.detectUp() do if not turtle.digUp() then error("Cannot dig up!") end; sleep(0.5) end 
end

-- Start by building a pillar to anchor our surface
while turtle.down() do z = z - 1 end
while z < 0 do
	turtle.up()
	z = z + 1
	turtle:putBlock()
end

-- build area, clearing around and above as necessary:
_y = 1
repeat
	for _x=1, args.x do
		if not turtle.detectDown() then	turtle:putBlock() end
		turtle:clearForward()
  	end

  	_y = _y + 1
  	if _y <= args.y then
  		turtle.turnRight()
  		turtle:clearForward()
  		turtle.turnRight()
  		turtle:clearForward()

		for _x=args.x, 1, -1 do
			if not turtle.detectDown() then	turtle:putBlock() end
			turtle:clearForward()
  		end

	  	_y = _y + 1

	  	if _y <= args.y then
	  		turtle.turnLeft()
  			turtle:clearForward()
  			turtle.turnLeft()
  			turtle:clearForward()
	  	end
  	end

until _y > args.y

-- TODO: Return to origin?


