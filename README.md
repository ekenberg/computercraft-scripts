## computercraft-scripts
=====================

Lua Scripts for [ComputerCraft](http://www.computercraft.info)

### makeflat.lua

![makeflat.lua working](http://ekenberg.github.io/computercraft-scripts/images/makeflat-working.png)

Make a flat rectangular area. Will remove blocks above and in the way. Places blocks only when necessary. If started in the air, will anchor the first block from the ground below. (try and you will understand)

Usage: makeflat.lua a b
where a and b are number of blocks.

a is in front of the turtle, and b to the right. So, to make a rectangle like this:

		######
		######
		######

you must position the turtle in the top left corner, facing right, and type "makeflat.lua 6 3"

Use with a mining turtle. Fuel and fill with enough blocks to build the area.

### blockwrite.lua

![blockwrite.lua hello world](http://ekenberg.github.io/computercraft-scripts/images/blockwrite-hello-world.png)

Write banner text with minecraft blocks. Needs a flat working area (prepare with makeflat.lua). Text height is 7 blocks.

Usage: blockwrite.lua Hello World!

Use with a mining turtle. Fuel and fill with enough blocks to write the text.

Position the turtle in the top left corner facing downwards, ie to write the letter A:

		oxx
		x  x
		x  x
		xxxx
		x  x
		x  x
		x  x

Turtle initial position is marked with "o". Face downwards. Type "blockwrite.lua A"

