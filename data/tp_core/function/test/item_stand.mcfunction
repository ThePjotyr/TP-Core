scoreboard players set @s tp_core.id 9999
function tp_core:item/give {id:"nope:item/none"}
loot replace entity @s armor.head loot tp_core:item/test_wand
function tp_core:item/on_equip
function tp_core:item/on_equip
item replace entity @s armor.head with minecraft:air
function tp_core:item/on_equip
loot replace entity @s armor.head loot tp_core:item/test_wand
function tp_core:item/on_equip
item replace entity @s weapon.offhand with minecraft:stick[custom_data={tp_core:{id:"tp_core:item/test_wand"}}]
function tp_core:item/held_dispatch {event:"use"}
kill @s
