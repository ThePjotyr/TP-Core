# Macro: base, id. Ray sample: spawns the display when this cell holds the base block and has no display yet.
$execute unless block ~ ~ ~ $(base) run return 0
execute align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=item_display,tag=tp_core.block,distance=..0.1] run return 0
scoreboard players set #r.stop tp_core.tmp 1
execute align xyz positioned ~.5 ~.5 ~.5 run function tp_core:block/spawn with storage tp_core:block p
