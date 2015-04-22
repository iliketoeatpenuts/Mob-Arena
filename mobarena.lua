local myWorld = World:new('mobarena');

-----------------
--Testing Lanes--
-----------------

--Location of Orange Mob Spawn
local OrangeLocation = Location:new(myWorld, 832, 101, 132);
local OrangeLane = Entity:new(OrangeLocation);

-- The boundaries of Orange Lane.
local orangelanearea = {
	minX = 831,
	minY = 103,
	minX = 142,
	maxX = 833,
	maxY = 101,
	maxZ = 130
};

--Location of Blue Mob Spawn
local BlueLocation = Location:new(myWorld, 835, 101, 132);
local BlueLane = Entity:new(BlueLocation);

-- The boundaries of Blue Lane.
local bluelanearea = {
	minX = 834,
	minY = 103,
	minX = 142,
	maxX = 836,
	maxY = 101,
	maxZ = 130
};

--Location of Green Mob Spawn
local GreenLocation = Location:new(myWorld, 838, 101, 132);
local GreenLane = Entity:new(GreenLocation);

-- The boundaries of Green Lane.
local greenlanearea = {
	minX = 837,
	minY = 103,
	minX = 142,
	maxX = 839,
	maxY = 101,
	maxZ = 130
};

--Location of Yellow Mob Spawn
local YellowLocation = Location:new(myWorld, 841, 101, 132);
local YellowLane = Entity:new(YellowLocation);

-- The boundaries of Yellow Lane.
local yellowlanearea = {
	minX = 840,
	minY = 103,
	minX = 142,
	maxX = 842,
	maxY = 101,
	maxZ = 130
};



function orange_test_spawn(data)
         OrangeLane:spawn("CREEPER");
end

function orange_test_despawn(data)
         OrangeLane:despawn();
end

function blue_test_spawn(data)
         BlueLane:spawn("ZOMBIE");
end

function blue_test_despawn(data)
         BlueLane:despawn();
end

function green_test_spawn(data)
         GreenLane:spawn("SKELETON");
end

function green_test_despawn(data)
         GreenLane:despawn();
end

function yellow_test_spawn(data)
         YellowLane:spawn("WITCH");
end

function yellow_test_despawn(data)
         YellowLane:despawn();
end

registerHook("INTERACT", "orange_test_spawn", 77, "mobarena", 831, 101, 143);
registerHook("INTERACT", "orange_test_despawn", 77, "mobarena", 832, 101, 143);
registerHook("INTERACT", "blue_test_spawn", 77, "mobarena", 834, 101, 143);
registerHook("INTERACT", "blue_test_despawn", 77, "mobarena", 835, 101, 143);
registerHook("INTERACT", "green_test_spawn", 77, "mobarena", 837, 101, 143);
registerHook("INTERACT", "green_test_despawn", 77, "mobarena", 838, 101, 143);
registerHook("INTERACT", "yellow_test_spawn", 77, "mobarena", 840, 101, 143);
registerHook("INTERACT", "yellow_test_despawn", 77, "mobarena", 841, 101, 143);

----------
--Lobby---
----------



----------
--Shop----
----------



---------------
--Nether Arena-
---------------



---------------------
--Underground Arena--
---------------------



---------------------
--Surface Arena------
---------------------



---------------------
--Ender Arena--------
---------------------



---------------------
--God Arena----------
---------------------



---------------------
--Cheeves------------
---------------------
