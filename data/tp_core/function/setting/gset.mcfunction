# Macro: id, value (0/1). Sets a global (server-wide) setting and fires #tp_core:event/setting/changed (scope "global").
# Needs no player. Players reach it only through dialog buttons that run `function`, which vanilla limits to operators.
$execute unless data storage tp_core:registry settings.by_id."$(id)"{scope:"global"} run return run function tp_core:setting/invalid {why:"gset $(id): not a registered global setting"}
$scoreboard players set #s.val tp_core.tmp $(value)
$execute unless score #s.val tp_core.tmp matches 0..1 run return run function tp_core:setting/invalid {why:"gset $(id): value must be 0 or 1"}
$execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"global setting $(id) = $(value)"}
$data modify storage tp_core:global settings."$(id)" set value $(value)
$data modify storage tp_core:setting changed set value {id:"$(id)",value:$(value),scope:"global"}
function #tp_core:event/setting/changed
