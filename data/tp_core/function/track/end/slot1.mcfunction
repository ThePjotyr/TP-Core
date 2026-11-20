execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot1"}
scoreboard players set @s tp_core.t_slot1 1
advancement revoke @s only tp_core:event/state_slot1
advancement revoke @s only tp_core:event/state_slot1_end
function #tp_core:event/player/slot1_end
