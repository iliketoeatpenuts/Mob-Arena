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

local surfacearenaenter = Location:new(myWorld, 41, 67, 1);

function to_surface_arena(data)
       local targetPlayer = Player:new(data.player);
       targetPlayer:teleport(surfacearenaenter);
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

local surfacearea = {
	minX = -53,
	minY = 61,
	minX = -54,
	maxX = 61,
	maxY = 161,
	maxZ = 62
};

local surfacesound = Location:new(myWorld, -3, 65, -1);
local surfacearenaexit = Location:new(myWorld, 837, 97, 149);


function surface_enter(data)
         local player = Player:new(data.player);
         a_broadcast_npc(Overlord, player.name .. " has &ajoined &fthe struggle in the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cHead to the center of the arena to get started!", player);
end

function surface_exit1(data)
      local targetPlayer = Player:new(data.player);
       targetPlayer:teleport(surfacearenaexit);
end

function surface_exit2(data)
      local player = Player:new(data.player);
       a_broadcast_npc(Overlord, player.name .. " has &cabandoned &fthe struggle in the &6Surface Arena&f!");
end

--Round control--


function s_round1_start(data)
         local player = Player:new(data.player);
      if not sR5Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 1 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound One has started, kill all mobs to move into round 2.", player);
         sRoundRunning = true;
         surfacesound:playSound('PORTAL_TRIGGER', 1, 2);
      else
         a_whisper_npc(Message, "&cFinish current round before starting Round 1.", player);
   end
end

function s_round2_start(data)
         local player = Player:new(data.player);
      if sR1Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 2 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Two has started, kill all mobs to move into round 3.", player);
         sRoundRunning = true;
         surfacesound:playSound('PORTAL_TRIGGER', 1, 2);
      else
         a_whisper_npc(Message, "&cFinish Round 1 before starting Round 2.", player);
   end
end

function s_round3_start(data)
         local player = Player:new(data.player);
      if sR2Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 3 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Three has started, kill all mobs to move into round 4.", player);
         sRoundRunning = true;
         surfacesound:playSound('PORTAL_TRIGGER', 1, 2);
      else
         a_whisper_npc(Message, "&cFinish Round 2 before starting Round 3.", player);
   end
end

function s_round4_start(data)
         local player = Player:new(data.player);
      if sR3Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 4 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Four has started, kill all mobs to move into round 5.", player);
         sRoundRunning = true;
         surfacesound:playSound('PORTAL_TRIGGER', 1, 2);
      else
         a_whisper_npc(Message, "&cFinish Round 3 before starting Round 4.", player);
   end
end

function s_round5_start(data)
         local player = Player:new(data.player);
      if sR4Done then 
         a_broadcast_npc(Overlord, player.name .. " has started &aRound 5 &fin the &6Surface Arena&f!");
         a_whisper_npc(Message, "&cRound Five has started, kill all mobs to finish the arena!", player);
         sRoundRunning = true;
         surfacesound:playSound('PORTAL_TRIGGER', 1, 2);
      else
         a_whisper_npc(Message, "&cFinish Round 4 before starting Round 5.", player);
   end
end


registerHook("REGION_ENTER", "surface_enter", "mobarena-arena_surface");
registerHook("INTERACT", "surface_exit1", 77, "mobarena", 30, 65, -2);
registerHook("REGION_LEAVE", "surface_exit2", "mobarena-arena_surface");
registerHook("INTERACT", "s_round1_start", 69, "mobarena", -7.0, 66.0, 1.0);
registerHook("INTERACT", "s_round2_start", 69, "mobarena", -7.0, 66.0, 0.0);
registerHook("INTERACT", "s_round3_start", 69, "mobarena", -7.0, 66.0, -1.0);
registerHook("INTERACT", "s_round4_start", 69, "mobarena", -7.0, 66.0, -2.0);
registerHook("INTERACT", "s_round5_start", 69, "mobarena", -7.0, 66.0, -3.0);


--Remove levers --

local current = 1;
local maxData = 14;
local blocks = {
	Location:new(myWorld, -7.0, 66.0, 1.0),
	Location:new(myWorld, -7.0, 66.0, 0.0),
	Location:new(myWorld, -7.0, 66.0, -1.0),
	Location:new(myWorld, -7.0, 66.0, -2.0),
	Location:new(myWorld, -7.0, 66.0, -3.0),
};

function s_removelevers(data)
	if current == maxData then
		current = 1;
	else
		current = current + 1;
	end
	s_re_lever();
end

function s_re_lever()
       if sRoundRunning then
	for index, key in ipairs(blocks) do
		key:setBlock(50, current);
      end
   end
end

local current = 1;
local maxData = 14;
local blocks = {
	Location:new(myWorld, -7.0, 66.0, 1.0),
	Location:new(myWorld, -7.0, 66.0, 0.0),
	Location:new(myWorld, -7.0, 66.0, -1.0),
	Location:new(myWorld, -7.0, 66.0, -2.0),
	Location:new(myWorld, -7.0, 66.0, -3.0),
};

function s_placelevers(data)
	if current == maxData then
		current = 1;
	else
		current = current + 1;
	end
	s_pl_lever();
end

function s_pl_lever()
       if not sRoundRunning then
	for index, key in ipairs(blocks) do
		key:setBlock(69, current);
      end
   end
end

registerHook("BLOCK_GAINS_CURRENT", "s_re_lever", "mobarena", -49.0, 114.0, 9.0);
registerHook("BLOCK_GAINS_CURRENT", "s_pl_lever", "mobarena", -49.0, 114.0, 9.0);

--Local Shop--

local current = 1;
local maxData = 14;
local blocks = {
	Location:new(myWorld, -32.0, 66.0, 2.0),
	Location:new(myWorld, -32.0, 66.0, 1.0),
	Location:new(myWorld, -32.0, 66.0, 0.0),
	Location:new(myWorld, -32.0, 67.0, 2.0),
	Location:new(myWorld, -32.0, 67.0, 1.0),
	Location:new(myWorld, -32.0, 67.0, 0.0),
	Location:new(myWorld, -32.0, 68.0, 2.0),
	Location:new(myWorld, -32.0, 68.0, 1.0),
	Location:new(myWorld, -32.0, 68.0, 0.0),
};

function s_placefence(data)
	if current == maxData then
		current = 1;
	else
		current = current + 1;
	end
	s_pl_fence();
end

function s_pl_fence()
       if sRoundRunning then
	for index, key in ipairs(blocks) do
		key:setBlock(85, current);
      end
   end
end

local current = 1;
local maxData = 14;
local blocks = {
	Location:new(myWorld, -32.0, 66.0, 2.0),
	Location:new(myWorld, -32.0, 66.0, 1.0),
	Location:new(myWorld, -32.0, 66.0, 0.0),
	Location:new(myWorld, -32.0, 67.0, 2.0),
	Location:new(myWorld, -32.0, 67.0, 1.0),
	Location:new(myWorld, -32.0, 67.0, 0.0),
	Location:new(myWorld, -32.0, 68.0, 2.0),
	Location:new(myWorld, -32.0, 68.0, 1.0),
	Location:new(myWorld, -32.0, 68.0, 0.0),
};

function s_removefence(data)
	if current == maxData then
		current = 1;
	else
		current = current + 1;
	end
	s_re_fence();
end

function s_re_fence()
       if not sRoundRunning then
	for index, key in ipairs(blocks) do
		key:setBlock(367, current);
      end
   end
end

registerHook("BLOCK_GAINS_CURRENT", "s_re_fence", "mobarena", -49.0, 114.0, 9.0);
registerHook("BLOCK_GAINS_CURRENT", "s_pl_fence", "mobarena", -49.0, 114.0, 9.0);

--Mob Spawning--



local sR1spawn1 = Location:new(myWorld, 4.0, 65.0, 17.0);
local s1FirstSpawn = Entity:new(sR1spawn1);

function s_round1_spawn1(data)
         s1FirstSpawn:spawn("ZOMBIE");
         s1FirstSpawn:spawn("ZOMBIE");
         s1FirstSpawn:spawn("CREEPER");
         s1FirstSpawn:spawn("SPIDER");
end

local sR1spawn2 = Location:new(myWorld, -11.0, 65.0, 16.0);
local s1SecondSpawn = Entity:new(sR1spawn2);

function s_round1_spawn2(data)
         s1SecondSpawn:spawn("SKELETON");
         s1SecondSpawn:spawn("SKELETON");
         s1SecondSpawn:spawn("CREEPER");
         s1SecondSpawn:spawn("SPIDER");
end

local sR1spawn3 = Location:new(myWorld, -18.0, 65.0,-5.0);
local s1ThirdSpawn = Entity:new(sR1spawn3);

function s_round1_spawn3(data)
         s1ThirdSpawn:spawn("ZOMBIE");
         s1ThirdSpawn:spawn("SPIDER");
         s1ThirdSpawn:spawn("CREEPER");
         s1ThirdSpawn:spawn("SPIDER");
end

local sR1spawn4 = Location:new(myWorld, 6.0, 65.0, -14.0);
local s1FourthSpawn = Entity:new(sR1spawn4);

function s_round1_spawn4(data)
         s1FourthSpawn:spawn("ZOMBIE");
         s1FourthSpawn:spawn("SPIDER");
         s1FourthSpawn:spawn("SPIDER");
         s1FourthSpawn:spawn("CREEPER");
end

local sR1spawn5 = Location:new(myWorld, 15.0, 65.0, 2.0);
local s1FiveSpawn = Entity:new(sR1spawn5);

function s_round1_spawn5(data)
         s1FiveSpawn:spawn("SKELETON");
         s1FiveSpawn:spawn("SKELETON");
         s1FiveSpawn:spawn("SKELETON");
         s1FiveSpawn:spawn("CREEPER");
end

registerHook("INTERACT", "s_round1_spawn1", 69, "mobarena", -7.0, 66.0, 1.0);
registerHook("INTERACT", "s_round1_spawn2", 69, "mobarena", -7.0, 66.0, 1.0);
registerHook("INTERACT", "s_round1_spawn3", 69, "mobarena", -7.0, 66.0, 1.0);
registerHook("INTERACT", "s_round1_spawn4", 69, "mobarena", -7.0, 66.0, 1.0);
registerHook("INTERACT", "s_round1_spawn5", 69, "mobarena", -7.0, 66.0, 1.0);

--ToDo:
--ROUND NEEDS TO END ITESLEF!
--CAN NOT RESTART ROUND TILL ALL ROUNDS ARE DONE
--IF NO PLAYERS IN ARENA ALL ROUNDS RESET.	
--Message on round end to tell player about shop, how to start.
--players in center to start?
--Respawn inside the arena if player dies.
--Effect Mobs
--Sounds
--Loot
--Change tp in face-direction.

---------------------
--Ender Arena--------
---------------------



---------------------
--God Arena----------
---------------------



---------------------
--Cheeves------------
---------------------


--------------------
--OVERRIDE----------
--------------------

--Surface Arena--

function s_o_reset_rounds(data)
         local player = Player:new(data.player);
         sR1Done = false;
         sR2Done = false;
         sR3Done = false;
         sR4Done = false;
         sR5Done = false;
         a_whisper_npc(Message, "&cOVERRIDE - ALL ROUNDS RESET", player);
end

function s_o_gamerunning(data)
         local player = Player:new(data.player);
         sRoundRunning = true;
         a_whisper_npc(Message, "&cOVERRIDE - GAME SET TO ACTIVE ROUND", player);
end

function s_o_gamenotrun(data)
         local player = Player:new(data.player);
         sRoundRunning = false;
         a_whisper_npc(Message, "&cOVERRIDE - GAME SET TO NO ACTIVE ROUND", player);
end

function s_o_r1_done(data)
         local player = Player:new(data.player);
         sR1Done = true;
         a_whisper_npc(Message, "&cOVERRIDE - ROUND ONE FORCED TO BE COMPLETE", player);
end

function s_o_r2_done(data)
         local player = Player:new(data.player);
         sR2Done = true;
         a_whisper_npc(Message, "&cOVERRIDE - ROUND TWO FORCED TO BE COMPLETE", player);
end

function s_o_r3_done(data)
         local player = Player:new(data.player);
         sR3Done = true;
         a_whisper_npc(Message, "&cOVERRIDE - ROUND THREE FORCED TO BE COMPLETE", player);
end

function s_o_r4_done(data)
         local player = Player:new(data.player);
         sR4Done = true;
         a_whisper_npc(Message, "&cOVERRIDE - ROUND FOUR FORCED TO BE COMPLETE", player);
end

function s_o_r5_done(data)
         local player = Player:new(data.player);
         sR5Done = true;
         a_whisper_npc(Message, "&cOVERRIDE - ROUND FIVE FORCED TO BE COMPLETE", player);
end

registerHook("INTERACT", "s_o_reset_rounds", 77, "mobarena", -39.0, 67.0, -7.0);
registerHook("INTERACT", "s_o_gamerunning", 77, "mobarena", -40.0, 67.0, -7.0);
registerHook("INTERACT", "s_o_gamenotrun", 77, "mobarena", -41.0, 67.0, -7.0);
registerHook("INTERACT", "s_o_r1_done", 77, "mobarena", -42.0, 67.0, -7.0);
registerHook("INTERACT", "s_o_r2_done", 77, "mobarena", -43.0, 67.0, -7.0);
registerHook("INTERACT", "s_o_r3_done", 77, "mobarena", -44.0, 67.0, -7.0);
registerHook("INTERACT", "s_o_r4_done", 77, "mobarena", -45.0, 67.0, -7.0);
registerHook("INTERACT", "s_o_r5_done", 77, "mobarena", -46.0, 67.0, -7.0);

