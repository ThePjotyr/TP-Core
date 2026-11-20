execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: sneak"}
scoreboard players set @s tp_core.t_sneak 1
advancement revoke @s only tp_core:event/state_sneak
advancement revoke @s only tp_core:event/state_sneak_end
function #tp_core:event/player/sneak_end
