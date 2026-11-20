# Macro: i, value. Trigger path for player settings. Out-of-range indexes and global settings are ignored (global ones only change through setting/gset, i.e. operators).
$data modify storage tp_core:setting cur set from storage tp_core:registry settings.list[$(i)]
execute unless data storage tp_core:setting cur run return 0
execute unless data storage tp_core:setting cur{scope:"player"} run return 0
data modify storage tp_core:setting a.id set from storage tp_core:setting cur.id
function tp_core:setting/set with storage tp_core:setting a
data modify storage tp_core:setting a.pack set from storage tp_core:setting cur.pack
function tp_core:setting/menu_pack with storage tp_core:setting a
