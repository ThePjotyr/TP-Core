# Macro: id, label, pack, scope, want, default. Adds one toggle button (label + current state) if the setting belongs to the pack being shown.
# Player settings: the button sends `trigger tp_core.setting set 100+2*i+v`. Global ones: `function tp_core:setting/gset_i` (operators only).
$execute unless data storage tp_core:setting cur{pack:"$(want)"} run return 0
$execute store result score #s.cur tp_core.tmp run function tp_core:setting/get {id:"$(id)"}
data modify storage tp_core:setting row set value {st:"OFF",sfx:""}
execute if score #s.cur tp_core.tmp matches 1 run data modify storage tp_core:setting row.st set value "ON"
$data modify storage tp_core:setting row.label set value "$(label)"
execute if data storage tp_core:setting cur{scope:"global"} run data modify storage tp_core:setting row.sfx set value " (operators)"
scoreboard players set #s.v tp_core.tmp 1
scoreboard players operation #s.v tp_core.tmp -= #s.cur tp_core.tmp
scoreboard players operation #s.n tp_core.tmp = #s.i tp_core.tmp
scoreboard players operation #s.n tp_core.tmp += #s.i tp_core.tmp
scoreboard players operation #s.n tp_core.tmp += #s.v tp_core.tmp
scoreboard players add #s.n tp_core.tmp 100
execute store result storage tp_core:setting row.n int 1 run scoreboard players get #s.n tp_core.tmp
execute store result storage tp_core:setting row.v int 1 run scoreboard players get #s.v tp_core.tmp
execute store result storage tp_core:setting row.i int 1 run scoreboard players get #s.i tp_core.tmp
execute if data storage tp_core:setting cur{scope:"global"} run return run function tp_core:setting/menu_add_global with storage tp_core:setting row
function tp_core:setting/menu_add with storage tp_core:setting row
