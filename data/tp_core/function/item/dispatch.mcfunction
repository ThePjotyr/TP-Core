# Macro: id, event (use|consume|place|equip). Runs the registered handler and #tp_core:event/item/<event> as @s.
# storage tp_core:item cur {id,event,fn} is readable by handlers. Unknown ids are ignored.
$execute if score #debug tp_core.tmp matches 1 run tellraw @s "[tp_core] item dispatch $(event) $(id)"
$execute unless data storage tp_core:registry items."$(id)" run return 0
$data modify storage tp_core:item cur set value {id:"$(id)",event:"$(event)"}
$data modify storage tp_core:item cur.fn set from storage tp_core:registry items."$(id)".on_$(event)
function tp_core:item/call with storage tp_core:item cur
