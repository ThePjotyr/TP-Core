# Macro: id, value (0/1). As the player: stores the value and fires #tp_core:event/setting/changed (storage tp_core:setting changed {id,value}).
execute store result storage tp_core:setting g.pid int 1 run scoreboard players get @s tp_core.id
$data modify storage tp_core:setting g.id set value "$(id)"
$data modify storage tp_core:setting g.value set value $(value)
function tp_core:setting/set_ with storage tp_core:setting g
data modify storage tp_core:setting changed set value {id:"",value:0}
data modify storage tp_core:setting changed.id set from storage tp_core:setting g.id
data modify storage tp_core:setting changed.value set from storage tp_core:setting g.value
function #tp_core:event/setting/changed
