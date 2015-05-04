--Needed for checking bounds, this is taken from another script, needs to be used to check for mobs(entitys) in an area.

if data.cause == 'LAVA' and a_within_bounds(player, 30, 54, -240, 46, 57, -220) then
		if a_within_bounds(player, 30, 54, -234, 33, 57, -231) then
			return;
		end

function a_fire_jump_hit(data)
	local player = Player:new(data.player);
	if a_within_bounds(player, -8, 53, -242, 24, 58, -218) then		
		a_fire_teleport(player);
	end
end

registerHook("PLAYER_DAMAGE", "a_fire_jump_hit", world.name);


--Used to add effect to mobs.

function Entity:addEffect(effect, duration, amp, amb)
    if self.entityID ~= nil then
        EventEngine.mobs.addEffect(self.world, self.entityID, effect, duration, amp, amb);
    end
end
