# Macro: id.
$data modify storage tp_core:block p.base set from storage tp_core:registry blocks."$(id)".base
function tp_core:block/probe_base with storage tp_core:block p
