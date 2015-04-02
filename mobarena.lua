local myWorld = World:new('spawn2');
local OrangeLocation = Location:new(myWorld, -38, 166, -292);
local OrangeLane = Entity:new(OrangeLocation);
local BlueLocation = Location:new(myWorld, -35, 166, -292);
local BlueLane = Entity:new(BlueLocation);
local GreenLocation = Location:new(myWorld, -32, 166, -292);
local GreenLane = Entity:new(GreenLocation);
local YellowLocation = Location:new(myWorld, -29, 166, -292);
local YellowLane = Entity:new(YellowLocation);

-----------------
--Testing Lanes--
-----------------

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
         YellowLane:spawn("SPIDER");
end

function yellow_test_despawn(data)
         YellowLane:despawn();
end

registerHook("INTERACT", "orange_test_spawn", 77, "spawn2", -39, 166, -281);
registerHook("INTERACT", "orange_test_despawn", 77, "spawn2", -38, 166, -281);
registerHook("INTERACT", "blue_test_spawn", 77, "spawn2", -36, 166, -281);
registerHook("INTERACT", "blue_test_despawn", 77, "spawn2", -35, 166, -281);
registerHook("INTERACT", "green_test_spawn", 77, "spawn2", -33, 166, -281);
registerHook("INTERACT", "green_test_despawn", 77, "spawn2", -32, 166, -281);
registerHook("INTERACT", "yellow_test_spawn", 77, "spawn2", -30, 166, -281);
registerHook("INTERACT", "yellow_test_despawn", 77, "spawn2", -29, 166, -281);

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
