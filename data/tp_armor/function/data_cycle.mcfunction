scoreboard players remove #tp.count tp.id 1

$data modify storage $(storage) Players append from storage $(storage) Players[0]
$data remove storage $(storage) Players[0]

$execute store result score #tp.count.temp tp.id run data get storage $(storage) Players[0].ID

execute if score #tp.count tp.id matches ..0 run tellraw @s {"text":"Couldn't find user's data.","color":"red"}
$execute if score #tp.count tp.id matches 1.. unless score #tp.count.temp tp.id = @s tp.id run function tp_armor:data_cycle {"function":"$(function)", "storage":"$(storage)"}
$execute if score #tp.count tp.id matches 1.. if score #tp.count.temp tp.id = @s tp.id at @s run function $(function)