execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"event player/first_join"}
scoreboard players operation @s tp_core.id = #next_id tp_core.id
scoreboard players add #next_id tp_core.id 1
function #tp_core:event/player/first_join
function tp_core:player/join
