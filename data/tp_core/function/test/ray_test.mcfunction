# Raycast test: stone at z=5, marker at z=0.5 looking +z.
scoreboard players set #t.rayhit tp_core.tmp 0
scoreboard players set #t.raycalls tp_core.tmp 0
scoreboard players set #t.rayshort tp_core.tmp 0
scoreboard players set #t.raystop tp_core.tmp 0
execute in minecraft:overworld run setblock 0 100 5 minecraft:stone
execute in minecraft:overworld positioned 0.5 100.2 0.5 rotated 0 0 summon marker run function tp_core:test/ray_cast

execute in minecraft:overworld run setblock 0 100 5 minecraft:air
