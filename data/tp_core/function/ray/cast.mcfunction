# Macro: range (blocks), step (blocks per sample, e.g. 0.5), fn ("ns:path").
# Casts from the caller's eyes along its view and runs fn at every sample position (as the caller).
# fn ends the ray early with: scoreboard players set #r.stop tp_core.tmp 1
# The ray also ends after the first block not in #tp_core:passable (fn still runs there) or when range is used up.
$data modify storage tp_core:ray in set value {step:$(step),fn:"$(fn)"}
execute store result score #r.n tp_core.tmp run data get storage tp_core:ray in.step 100
$scoreboard players set #r.range tp_core.tmp $(range)
scoreboard players set #r.hundred tp_core.tmp 100
scoreboard players operation #r.range tp_core.tmp *= #r.hundred tp_core.tmp
scoreboard players operation #r.range tp_core.tmp /= #r.n tp_core.tmp
scoreboard players add #r.range tp_core.tmp 1
execute anchored eyes positioned ^ ^ ^ run function tp_core:ray/step with storage tp_core:ray in
