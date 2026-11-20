# Macro: pid, slot. Compares the custom item id in the slot with the remembered one (storage tp_core:worn).
data modify storage tp_core:item new set value ""
$data modify storage tp_core:item new set from entity @s equipment.$(slot).components."minecraft:custom_data".tp_core.id
$execute store success score #i.changed tp_core.tmp run data modify storage tp_core:worn p$(pid).$(slot) set from storage tp_core:item new
execute if score #i.changed tp_core.tmp matches 0 run return 0
execute if data storage tp_core:item {new:""} run return 0
data modify storage tp_core:item ev set value {event:"equip"}
data modify storage tp_core:item ev.id set from storage tp_core:item new
function tp_core:item/dispatch with storage tp_core:item ev
