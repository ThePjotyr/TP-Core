# Macro: i (index in registry settings.pack_list). Out-of-range indexes are ignored.
data remove storage tp_core:setting cur
$data modify storage tp_core:setting cur set from storage tp_core:registry settings.pack_list[$(i)]
execute unless data storage tp_core:setting cur run return 0
data modify storage tp_core:setting a.pack set from storage tp_core:setting cur.id
function tp_core:setting/menu_pack with storage tp_core:setting a
