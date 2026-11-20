# Macro: i (index in registry settings.list), value. Dialog button for a global setting: sets it, then shows the pack menu again.
data remove storage tp_core:setting cur
$data modify storage tp_core:setting cur set from storage tp_core:registry settings.list[$(i)]
execute unless data storage tp_core:setting cur run return 0
data modify storage tp_core:setting a set value {}
data modify storage tp_core:setting a.id set from storage tp_core:setting cur.id
$data modify storage tp_core:setting a.value set value $(value)
function tp_core:setting/gset with storage tp_core:setting a
data modify storage tp_core:setting a.pack set from storage tp_core:setting cur.pack
function tp_core:setting/menu_pack with storage tp_core:setting a
