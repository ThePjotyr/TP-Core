# Macro: step, fn. One sample of tp_core:ray/cast; recurses forward until the ray ends.
scoreboard players set #r.stop tp_core.tmp 0
$function $(fn)
execute unless score #r.stop tp_core.tmp matches 0 run return 0
execute unless block ~ ~ ~ #tp_core:passable run return 0
scoreboard players remove #r.range tp_core.tmp 1
execute if score #r.range tp_core.tmp matches ..0 run return 0
$execute positioned ^ ^ ^$(step) run function tp_core:ray/step with storage tp_core:ray in
