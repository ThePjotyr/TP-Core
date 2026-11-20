execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: slot8"}
scoreboard players set @s tp_core.t_slot8 1
advancement revoke @s only tp_core:event/state_slot8
advancement revoke @s only tp_core:event/state_slot8_end
function #tp_core:event/player/slot8_end
