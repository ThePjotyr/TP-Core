$execute store result score #tp.count tp.id run data get storage $(storage) Players
$execute store result score #tp.count.temp tp.id run data get storage $(storage) Players[0].ID

$execute if score #tp.count tp.id matches 1.. unless score #tp.count.temp tp.id = @s tp.id run function tp_armor:data_cycle {"function":"tp_armor:summon_armor", "storage":"$(storage)"}
$execute if score #tp.count tp.id matches 1.. if score #tp.count.temp tp.id = @s tp.id at @s run function tp_armor:summon_armor {"storage":"$(storage)"}
