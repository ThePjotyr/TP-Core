# Macro: id. Orphans of a removed registration are left alone.
$execute unless data storage tp_core:registry blocks."$(id)" run return 0
$data modify storage tp_core:block e set from storage tp_core:registry blocks."$(id)"
$data modify storage tp_core:block e.id set value "$(id)"
function tp_core:block/check_e with storage tp_core:block e
