execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot2"}
scoreboard players set @s tp_core.t_slot2 1
advancement revoke @s only tp_core:event/state_slot2
advancement revoke @s only tp_core:event/state_slot2_end
function #tp_core:event/player/slot2_end
