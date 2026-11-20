execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot4"}
scoreboard players set @s tp_core.t_slot4 1
advancement revoke @s only tp_core:event/state_slot4
advancement revoke @s only tp_core:event/state_slot4_end
function #tp_core:event/player/slot4_end
