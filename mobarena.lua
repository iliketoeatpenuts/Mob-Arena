local myWorld = World:new('mobarena');


--------
---AI---
--------

local Overlord = 'PVE'
local Message = ''

function a_broadcast(msg)
	myWorld:broadcast(msg);
end

function a_broadcast_npc(npc, msg)
	a_broadcast('&f&c' .. npc .. '&6: &f' .. msg);
end

function a_whisper_npc(npc, msg, player)
	player:sendMessage('&f&c' .. npc .. '&f' .. msg);
end

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

local surfacearena = Location:new(myWorld, 41, 67, 1);

function to_surface_arena(data)
       local targetPlayer = Player:new(data.player);
       targetPlayer:teleport(surfacearena);
end

registerHook("REGION_ENTER", "to_surface_arena", "mobarena-portal_surfacearena");


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

--To know when a Round is completed.
local sR1Done = false;
local sR2Done = false;
local sR3Done = false;
local sR4Done = false;
local sR5Done = false;
--To know when a Round is in-progress.
local sRoundRunning = false;


function surface_enter(data)
         local player = Player:new(data.player);
         a_broadcast_npc(Overlord, player.name .. " has entered the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cHead to the center of the arena to get started!", player);
end

function s_round1_start(data)
         local player = Player:new(data.player);
      if not sR5Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 1 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound One has started, kill all mobs to move into round 2.", player);
         sRoundRunning = true;
   end
end

function s_round2_start(data)
         local player = Player:new(data.player);
      if sR1Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 1 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Two has started, kill all mobs to move into round 3.", player);
         sRoundRunning = true;
   end
end

function s_round3_start(data)
         local player = Player:new(data.player);
      if sR2Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 1 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Three has started, kill all mobs to move into round 4.", player);
         sRoundRunning = true;
   end
end

function s_round4_start(data)
         local player = Player:new(data.player);
      if sR3Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 1 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Four has started, kill all mobs to move into round 5.", player);
         sRoundRunning = true;
   end
end

function s_round5_start(data)
         local player = Player:new(data.player);
      if sR4Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 1 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Five has started, kill all mobs to finish the arena!", player);
         sRoundRunning = true;
   end
end
    
registerHook("REGION_ENTER", "surface_enter", "mobarena-arena_surface_enter");
registerHook("INTERACT", "s_round1_start", 69, "mobarena", -3, 66, -1);
registerHook("INTERACT", "s_round2_start", 69, "mobarena", 0, 66, -4);
registerHook("INTERACT", "s_round3_start", 69, "mobarena", 0, 66, 2);
registerHook("INTERACT", "s_round4_start", 69, "mobarena", -6, 66, 2);
registerHook("INTERACT", "s_round5_start", 69, "mobarena", -6, 66, -4);


--ToDo:
--ONLY ONE ROUND CAN RUN AT A TIME!!!!!!
--Must Play Rounds in order!!!
--Lever Needs to be flipped at the end of each round to start the next round.
--Lever can not be flipped during a round, get an error message.
--Respawn inside the arena if player dies.
--At the end of round 5 all players back to lobby.
--Cheeves
--Loot
--Coins for shop
--Signs to show whos in the lobby.



---------------------
--Ender Arena--------
---------------------



---------------------
--God Arena----------
---------------------



---------------------
--Cheeves------------
---------------------
