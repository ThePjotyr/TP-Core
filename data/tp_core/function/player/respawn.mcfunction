execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"event player/respawn"}
scoreboard players set @s tp_core.deaths 0
advancement revoke @s only tp_core:event/respawn
function #tp_core:event/player/respawn
