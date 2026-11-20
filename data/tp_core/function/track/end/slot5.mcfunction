execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot5"}
scoreboard players set @s tp_core.t_slot5 1
advancement revoke @s only tp_core:event/state_slot5
advancement revoke @s only tp_core:event/state_slot5_end
function #tp_core:event/player/slot5_end
