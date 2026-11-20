# Macro: id. As the new display: show the custom item (RP hook: item_model in the item's loot table), join the block loop.
$loot replace entity @s contents loot $(id)
tag @s add tp_core.block
# Slightly larger than the base block so the faces do not z-fight.
data modify entity @s transformation.scale set value [1.001f,1.001f,1.001f]
scoreboard players add #b.count tp_core.tmp 1
function tp_core:block/watchdog_start
$data modify storage tp_core:block e set from storage tp_core:registry blocks."$(id)"
function tp_core:block/light with storage tp_core:block e
# Blocks that react to pistons are polled every tick: a quick piston leaves no trace for a slower poll.
execute if data storage tp_core:block e{pistons:1} run function tp_core:loop/join {loop:"block_fast"}
execute unless data storage tp_core:block e{pistons:1} run function tp_core:loop/join {loop:"block"}
execute if data storage tp_core:block e{on_place:""} run return 0
function tp_core:block/call_place with storage tp_core:block e
