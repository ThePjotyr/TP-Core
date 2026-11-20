# Reward of event/item_equip (any inventory change): fires on_equip once per newly worn custom item.
advancement revoke @s only tp_core:event/item_equip
execute store result storage tp_core:item eq.pid int 1 run scoreboard players get @s tp_core.id
data modify storage tp_core:item eq.slot set value "head"
function tp_core:item/equip_slot with storage tp_core:item eq
data modify storage tp_core:item eq.slot set value "chest"
function tp_core:item/equip_slot with storage tp_core:item eq
data modify storage tp_core:item eq.slot set value "legs"
function tp_core:item/equip_slot with storage tp_core:item eq
data modify storage tp_core:item eq.slot set value "feet"
function tp_core:item/equip_slot with storage tp_core:item eq
