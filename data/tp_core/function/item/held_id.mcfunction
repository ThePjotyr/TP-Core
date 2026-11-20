# Sets storage tp_core:item held to the tp_core item id in @s's main hand, else off hand ("" if none).
data modify storage tp_core:item held set value ""
data modify storage tp_core:item held set from entity @s SelectedItem.components."minecraft:custom_data".tp_core.id
execute if data storage tp_core:item {held:""} run data modify storage tp_core:item held set from entity @s equipment.offhand.components."minecraft:custom_data".tp_core.id
