execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot0"}
scoreboard players set @s tp_core.t_slot0 1
advancement revoke @s only tp_core:event/state_slot0
advancement revoke @s only tp_core:event/state_slot0_end
function #tp_core:event/player/slot0_end
