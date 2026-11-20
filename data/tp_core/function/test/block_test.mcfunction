# Blocks: placement via raycast from a stand-in "player" (marker facing +z), on_place/on_tick/on_break, watchdog and loop stop.
scoreboard players set #t.b_place tp_core.tmp 0
scoreboard players set #t.b_break tp_core.tmp 0
scoreboard players set #t.b_tick tp_core.tmp 0
function tp_core:block/register {id:"tp_core:item/test_block",base:"minecraft:blast_furnace",on_place:"tp_core:test/block_place",on_break:"tp_core:test/block_break",on_tick:"tp_core:test/block_tick"}
execute in minecraft:overworld run setblock 0 100 15 minecraft:blast_furnace
data modify storage tp_core:item cur set value {id:"tp_core:item/test_block"}
execute in minecraft:overworld positioned 0.5 100.2 12.5 rotated 0 0 summon marker run function tp_core:test/block_place_as
function tp_core:queue/after {delay:50,fn:"tp_core:test/block_mid"}
