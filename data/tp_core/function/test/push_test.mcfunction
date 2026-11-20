# Pistons: a glass block (drops nothing, pistons=1) pushed by a piston and pulled by a sticky piston must leave no stray block, one custom item each.
scoreboard players set #t.p_break tp_core.tmp 0
# push: piston (0,100,19) facing south, glass + display at z=20 (moves to z=21), redstone block at z=18 powers it
data modify storage tp_core:block p set value {id:"tp_core:item/test_push"}
execute in minecraft:overworld run setblock 0 100 19 minecraft:piston[facing=south]
execute in minecraft:overworld run setblock 0 100 20 minecraft:glass
execute in minecraft:overworld positioned 0.5 100.5 20.5 run function tp_core:block/spawn with storage tp_core:block p
execute in minecraft:overworld run setblock 0 100 18 minecraft:redstone_block
# pull: sticky piston (5,100,19) facing south, extended first by a redstone block; display at z=21 (pulled to z=20)
execute in minecraft:overworld run setblock 5 100 19 minecraft:sticky_piston[facing=south]
execute in minecraft:overworld run setblock 5 100 18 minecraft:redstone_block
function tp_core:queue/after {delay:12,fn:"tp_core:test/push_pull"}
# quick: non-sticky piston (10,100,19), glass + display at z=20; the redstone block is removed one tick after it is placed
execute in minecraft:overworld run setblock 10 100 19 minecraft:piston[facing=south]
execute in minecraft:overworld run setblock 10 100 20 minecraft:glass
execute in minecraft:overworld positioned 10.5 100.5 20.5 run function tp_core:block/spawn with storage tp_core:block p
execute in minecraft:overworld run setblock 10 100 18 minecraft:redstone_block
function tp_core:queue/after {delay:1,fn:"tp_core:test/push_quick_off"}
