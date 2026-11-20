# Macro: base. As the display whose base block is gone. Handles a block moved by a directly adjacent piston:
# returns 1 while a piston is still moving (check again next poll); otherwise removes the moved copy (no drop) and returns 0.
# shortcut: chains (a pushed block pushing the custom block) and a custom block pushed by a piston not adjacent to it are not detected.
execute if block ~ ~ ~ minecraft:moving_piston run return 1
# push north: piston_head at the old cell, moved copy one cell ahead
execute if block ~ ~ ~ minecraft:piston_head[facing=north] if block ~ ~ ~-1 minecraft:moving_piston run return 1
$execute if block ~ ~ ~ minecraft:piston_head[facing=north] if block ~ ~ ~-1 $(base) run setblock ~ ~ ~-1 minecraft:air
# sticky pull north: copy pulled one cell back toward the piston two cells away
execute if block ~ ~ ~1 minecraft:moving_piston if block ~ ~ ~2 minecraft:sticky_piston[facing=north] run return 1
$execute if block ~ ~ ~2 minecraft:sticky_piston[facing=north,extended=false] if block ~ ~ ~1 $(base) run setblock ~ ~ ~1 minecraft:air
# push south: piston_head at the old cell, moved copy one cell ahead
execute if block ~ ~ ~ minecraft:piston_head[facing=south] if block ~ ~ ~1 minecraft:moving_piston run return 1
$execute if block ~ ~ ~ minecraft:piston_head[facing=south] if block ~ ~ ~1 $(base) run setblock ~ ~ ~1 minecraft:air
# sticky pull south: copy pulled one cell back toward the piston two cells away
execute if block ~ ~ ~-1 minecraft:moving_piston if block ~ ~ ~-2 minecraft:sticky_piston[facing=south] run return 1
$execute if block ~ ~ ~-2 minecraft:sticky_piston[facing=south,extended=false] if block ~ ~ ~-1 $(base) run setblock ~ ~ ~-1 minecraft:air
# push east: piston_head at the old cell, moved copy one cell ahead
execute if block ~ ~ ~ minecraft:piston_head[facing=east] if block ~1 ~ ~ minecraft:moving_piston run return 1
$execute if block ~ ~ ~ minecraft:piston_head[facing=east] if block ~1 ~ ~ $(base) run setblock ~1 ~ ~ minecraft:air
# sticky pull east: copy pulled one cell back toward the piston two cells away
execute if block ~-1 ~ ~ minecraft:moving_piston if block ~-2 ~ ~ minecraft:sticky_piston[facing=east] run return 1
$execute if block ~-2 ~ ~ minecraft:sticky_piston[facing=east,extended=false] if block ~-1 ~ ~ $(base) run setblock ~-1 ~ ~ minecraft:air
# push west: piston_head at the old cell, moved copy one cell ahead
execute if block ~ ~ ~ minecraft:piston_head[facing=west] if block ~-1 ~ ~ minecraft:moving_piston run return 1
$execute if block ~ ~ ~ minecraft:piston_head[facing=west] if block ~-1 ~ ~ $(base) run setblock ~-1 ~ ~ minecraft:air
# sticky pull west: copy pulled one cell back toward the piston two cells away
execute if block ~1 ~ ~ minecraft:moving_piston if block ~2 ~ ~ minecraft:sticky_piston[facing=west] run return 1
$execute if block ~2 ~ ~ minecraft:sticky_piston[facing=west,extended=false] if block ~1 ~ ~ $(base) run setblock ~1 ~ ~ minecraft:air
# push up: piston_head at the old cell, moved copy one cell ahead
execute if block ~ ~ ~ minecraft:piston_head[facing=up] if block ~ ~1 ~ minecraft:moving_piston run return 1
$execute if block ~ ~ ~ minecraft:piston_head[facing=up] if block ~ ~1 ~ $(base) run setblock ~ ~1 ~ minecraft:air
# sticky pull up: copy pulled one cell back toward the piston two cells away
execute if block ~ ~-1 ~ minecraft:moving_piston if block ~ ~-2 ~ minecraft:sticky_piston[facing=up] run return 1
$execute if block ~ ~-2 ~ minecraft:sticky_piston[facing=up,extended=false] if block ~ ~-1 ~ $(base) run setblock ~ ~-1 ~ minecraft:air
# push down: piston_head at the old cell, moved copy one cell ahead
execute if block ~ ~ ~ minecraft:piston_head[facing=down] if block ~ ~-1 ~ minecraft:moving_piston run return 1
$execute if block ~ ~ ~ minecraft:piston_head[facing=down] if block ~ ~-1 ~ $(base) run setblock ~ ~-1 ~ minecraft:air
# sticky pull down: copy pulled one cell back toward the piston two cells away
execute if block ~ ~1 ~ minecraft:moving_piston if block ~ ~2 ~ minecraft:sticky_piston[facing=down] run return 1
$execute if block ~ ~2 ~ minecraft:sticky_piston[facing=down,extended=false] if block ~ ~1 ~ $(base) run setblock ~ ~1 ~ minecraft:air
return 0
