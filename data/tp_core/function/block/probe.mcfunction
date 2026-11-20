data modify storage tp_core:block p set value {}
data modify storage tp_core:block p.id set from storage tp_core:item cur.id
function tp_core:block/probe_id with storage tp_core:block p
