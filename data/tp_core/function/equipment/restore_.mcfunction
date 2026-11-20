# Macro: pid.
$execute unless data storage tp_core:equipment p$(pid) run return fail
$data modify storage tp_core:equipment s set from storage tp_core:equipment p$(pid)
$data remove storage tp_core:equipment p$(pid)
tag @s remove tp_core.equipment.stored
function tp_core:equipment/slot {slot:"head"}
function tp_core:equipment/slot {slot:"chest"}
function tp_core:equipment/slot {slot:"legs"}
function tp_core:equipment/slot {slot:"feet"}
