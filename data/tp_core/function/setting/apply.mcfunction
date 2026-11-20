# Macro: i, value. Out-of-range indexes are ignored.
$data modify storage tp_core:setting cur set from storage tp_core:registry settings.list[$(i)]
execute unless data storage tp_core:setting cur run return 0
data modify storage tp_core:setting a.id set from storage tp_core:setting cur.id
function tp_core:setting/set with storage tp_core:setting a
function tp_core:setting/menu
