# Macro: id, label. Adds one toggle button: label + current state; clicking sends the opposite value.
$execute store result score #s.cur tp_core.tmp run function tp_core:setting/get {id:"$(id)"}
data modify storage tp_core:setting row set value {st:"OFF"}
execute if score #s.cur tp_core.tmp matches 1 run data modify storage tp_core:setting row.st set value "ON"
$data modify storage tp_core:setting row.label set value "$(label)"
scoreboard players set #s.n tp_core.tmp 1
scoreboard players operation #s.n tp_core.tmp -= #s.cur tp_core.tmp
scoreboard players operation #s.n tp_core.tmp += #s.i tp_core.tmp
scoreboard players operation #s.n tp_core.tmp += #s.i tp_core.tmp
scoreboard players add #s.n tp_core.tmp 100
execute store result storage tp_core:setting row.n int 1 run scoreboard players get #s.n tp_core.tmp
function tp_core:setting/menu_add with storage tp_core:setting row
