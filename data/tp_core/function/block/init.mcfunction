# Macro: id. As the new display: show the custom item (RP hook: item_model in the item's loot table), join the block loop.
$loot replace entity @s contents loot $(id)
tag @s add tp_core.block
# Slightly larger than the base block (no z-fighting), full brightness (inside an opaque block a display would render dark).
data modify entity @s transformation.scale set value [1.001f,1.001f,1.001f]
data modify entity @s brightness set value {sky:15,block:15}
function tp_core:loop/join {loop:"block"}
scoreboard players add #b.count tp_core.tmp 1
function tp_core:block/watchdog_start
$data modify storage tp_core:block e set from storage tp_core:registry blocks."$(id)"
execute if data storage tp_core:block e{on_place:""} run return 0
function tp_core:block/call_place with storage tp_core:block e
