# Macro: id, value (0/1). As the player: stores a player setting and fires #tp_core:event/setting/changed (storage tp_core:setting changed {id,value,scope}).
$execute unless data storage tp_core:registry settings.by_id."$(id)"{scope:"player"} run return run function tp_core:setting/invalid {why:"set $(id): not a registered player setting"}
$scoreboard players set #s.val tp_core.tmp $(value)
$execute unless score #s.val tp_core.tmp matches 0..1 run return run function tp_core:setting/invalid {why:"set $(id): value must be 0 or 1"}
execute store result storage tp_core:setting g.pid int 1 run scoreboard players get @s tp_core.id
$execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"setting set $(id) = $(value)"}
$data modify storage tp_core:setting g.id set value "$(id)"
$data modify storage tp_core:setting g.value set value $(value)
function tp_core:setting/set_ with storage tp_core:setting g
data modify storage tp_core:setting changed set value {id:"",value:0,scope:"player"}
data modify storage tp_core:setting changed.id set from storage tp_core:setting g.id
data modify storage tp_core:setting changed.value set from storage tp_core:setting g.value
function #tp_core:event/setting/changed
