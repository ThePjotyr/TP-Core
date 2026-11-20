execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot3"}
scoreboard players set @s tp_core.t_slot3 1
advancement revoke @s only tp_core:event/state_slot3
advancement revoke @s only tp_core:event/state_slot3_end
function #tp_core:event/player/slot3_end
