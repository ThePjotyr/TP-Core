# Macro: slot. Restores storage tp_core:equipment s.<slot> if present.
data modify storage tp_core:equipment it set value {components:{},count:1}
$execute unless data storage tp_core:equipment s.$(slot) run return 0
$data modify storage tp_core:equipment it merge from storage tp_core:equipment s.$(slot)
$data modify storage tp_core:equipment it.slot set value "$(slot)"
function tp_core:equipment/put with storage tp_core:equipment it
