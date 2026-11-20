# Macro: event. Dispatches the tp_core item @s is holding, if any.
function tp_core:item/held_id
$data modify storage tp_core:item ev set value {event:"$(event)"}
data modify storage tp_core:item ev.id set from storage tp_core:item held
execute if data storage tp_core:item {held:""} run return 0
function tp_core:item/dispatch with storage tp_core:item ev
