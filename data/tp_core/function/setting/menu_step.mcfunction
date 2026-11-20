execute unless data storage tp_core:setting work[0] run return 0
data modify storage tp_core:setting cur set from storage tp_core:setting work[0]
data remove storage tp_core:setting work[0]
data modify storage tp_core:setting cur.want set from storage tp_core:setting want
function tp_core:setting/menu_one with storage tp_core:setting cur
scoreboard players add #s.i tp_core.tmp 1
function tp_core:setting/menu_step
