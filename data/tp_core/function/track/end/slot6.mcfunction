execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot6"}
scoreboard players set @s tp_core.t_slot6 1
advancement revoke @s only tp_core:event/state_slot6
advancement revoke @s only tp_core:event/state_slot6_end
function #tp_core:event/player/slot6_end
