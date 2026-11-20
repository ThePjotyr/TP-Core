# Macro: pid.
$execute if data storage tp_core:equipment p$(pid) run return fail
$data modify storage tp_core:equipment p$(pid) set value {}
$data modify storage tp_core:equipment p$(pid).head set from entity @s equipment.head
$data modify storage tp_core:equipment p$(pid).chest set from entity @s equipment.chest
$data modify storage tp_core:equipment p$(pid).legs set from entity @s equipment.legs
$data modify storage tp_core:equipment p$(pid).feet set from entity @s equipment.feet
tag @s add tp_core.equipment.stored
