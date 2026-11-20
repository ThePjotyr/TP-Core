execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot7"}
scoreboard players set @s tp_core.t_slot7 1
advancement revoke @s only tp_core:event/state_slot7
advancement revoke @s only tp_core:event/state_slot7_end
function #tp_core:event/player/slot7_end
