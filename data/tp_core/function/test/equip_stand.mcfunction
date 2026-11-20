scoreboard players set @s tp_core.id 9997
item replace entity @s armor.head with minecraft:iron_helmet[custom_data={a:7}]
item replace entity @s armor.feet with minecraft:leather_boots
function tp_core:equipment/save
execute if entity @s[tag=tp_core.equipment.stored] run scoreboard players set #t.e_tag tp_core.tmp 1
function tp_core:equipment/clear
execute unless data entity @s equipment.head run scoreboard players set #t.e_clear tp_core.tmp 1
item replace entity @s armor.chest with minecraft:diamond_chestplate
function tp_core:equipment/save
execute store result score #t.e_refuse tp_core.tmp run function tp_core:equipment/save
function tp_core:equipment/restore
execute store result score #t.e_a tp_core.tmp run data get entity @s equipment.head.components."minecraft:custom_data".a
execute if data entity @s equipment.feet{id:"minecraft:leather_boots"} run scoreboard players set #t.e_feet tp_core.tmp 1
execute if data entity @s equipment.chest{id:"minecraft:diamond_chestplate"} run scoreboard players set #t.e_chest tp_core.tmp 1
execute if entity @s[tag=tp_core.equipment.stored] run scoreboard players set #t.e_tag tp_core.tmp 2
execute if data storage tp_core:equipment p9997 run scoreboard players set #t.e_left tp_core.tmp 1
kill @s
