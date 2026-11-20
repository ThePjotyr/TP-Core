# Macro: base. As the display whose base block is gone (pistons:1 blocks only). Returns 1 while a piston is moving nearby (check again next tick),
# otherwise removes the copy a directly adjacent piston/sticky piston moved (no drop) and returns 0.
# shortcut: chains (a pushed block pushing the custom block) and pistons not adjacent to the block are not detected.
# A moving_piston within 2 cells (on an axis) means a push/pull is in progress: remember it (tag) and wait.
execute if block ~ ~ ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~1 ~ ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~-1 ~ ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~1 ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~-1 ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~ ~1 minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~ ~-1 minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~2 ~ ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~-2 ~ ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~2 ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~-2 ~ minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~ ~2 minecraft:moving_piston run return run function tp_core:block/piston_wait
execute if block ~ ~ ~-2 minecraft:moving_piston run return run function tp_core:block/piston_wait
# north: piston head still out at the old cell, moved copy one cell ahead
$execute if block ~ ~ ~ minecraft:piston_head[facing=north] if block ~ ~ ~-1 $(base) run setblock ~ ~ ~-1 minecraft:air
# north: sticky piston pulled the copy one cell back toward it
$execute if block ~ ~ ~2 minecraft:sticky_piston[facing=north,extended=false] if block ~ ~ ~1 $(base) run setblock ~ ~ ~1 minecraft:air
# north: piston already retracted after pushing the copy one cell ahead (only after a piston was seen moving)
$execute if entity @s[tag=tp_core.pmoved] if block ~ ~ ~1 #tp_core:pistons[facing=north] if block ~ ~ ~-1 $(base) run setblock ~ ~ ~-1 minecraft:air
# south: piston head still out at the old cell, moved copy one cell ahead
$execute if block ~ ~ ~ minecraft:piston_head[facing=south] if block ~ ~ ~1 $(base) run setblock ~ ~ ~1 minecraft:air
# south: sticky piston pulled the copy one cell back toward it
$execute if block ~ ~ ~-2 minecraft:sticky_piston[facing=south,extended=false] if block ~ ~ ~-1 $(base) run setblock ~ ~ ~-1 minecraft:air
# south: piston already retracted after pushing the copy one cell ahead (only after a piston was seen moving)
$execute if entity @s[tag=tp_core.pmoved] if block ~ ~ ~-1 #tp_core:pistons[facing=south] if block ~ ~ ~1 $(base) run setblock ~ ~ ~1 minecraft:air
# east: piston head still out at the old cell, moved copy one cell ahead
$execute if block ~ ~ ~ minecraft:piston_head[facing=east] if block ~1 ~ ~ $(base) run setblock ~1 ~ ~ minecraft:air
# east: sticky piston pulled the copy one cell back toward it
$execute if block ~-2 ~ ~ minecraft:sticky_piston[facing=east,extended=false] if block ~-1 ~ ~ $(base) run setblock ~-1 ~ ~ minecraft:air
# east: piston already retracted after pushing the copy one cell ahead (only after a piston was seen moving)
$execute if entity @s[tag=tp_core.pmoved] if block ~-1 ~ ~ #tp_core:pistons[facing=east] if block ~1 ~ ~ $(base) run setblock ~1 ~ ~ minecraft:air
# west: piston head still out at the old cell, moved copy one cell ahead
$execute if block ~ ~ ~ minecraft:piston_head[facing=west] if block ~-1 ~ ~ $(base) run setblock ~-1 ~ ~ minecraft:air
# west: sticky piston pulled the copy one cell back toward it
$execute if block ~2 ~ ~ minecraft:sticky_piston[facing=west,extended=false] if block ~1 ~ ~ $(base) run setblock ~1 ~ ~ minecraft:air
# west: piston already retracted after pushing the copy one cell ahead (only after a piston was seen moving)
$execute if entity @s[tag=tp_core.pmoved] if block ~1 ~ ~ #tp_core:pistons[facing=west] if block ~-1 ~ ~ $(base) run setblock ~-1 ~ ~ minecraft:air
# up: piston head still out at the old cell, moved copy one cell ahead
$execute if block ~ ~ ~ minecraft:piston_head[facing=up] if block ~ ~1 ~ $(base) run setblock ~ ~1 ~ minecraft:air
# up: sticky piston pulled the copy one cell back toward it
$execute if block ~ ~-2 ~ minecraft:sticky_piston[facing=up,extended=false] if block ~ ~-1 ~ $(base) run setblock ~ ~-1 ~ minecraft:air
# up: piston already retracted after pushing the copy one cell ahead (only after a piston was seen moving)
$execute if entity @s[tag=tp_core.pmoved] if block ~ ~-1 ~ #tp_core:pistons[facing=up] if block ~ ~1 ~ $(base) run setblock ~ ~1 ~ minecraft:air
# down: piston head still out at the old cell, moved copy one cell ahead
$execute if block ~ ~ ~ minecraft:piston_head[facing=down] if block ~ ~-1 ~ $(base) run setblock ~ ~-1 ~ minecraft:air
# down: sticky piston pulled the copy one cell back toward it
$execute if block ~ ~2 ~ minecraft:sticky_piston[facing=down,extended=false] if block ~ ~1 ~ $(base) run setblock ~ ~1 ~ minecraft:air
# down: piston already retracted after pushing the copy one cell ahead (only after a piston was seen moving)
$execute if entity @s[tag=tp_core.pmoved] if block ~ ~1 ~ #tp_core:pistons[facing=down] if block ~ ~-1 ~ $(base) run setblock ~ ~-1 ~ minecraft:air
return 0
