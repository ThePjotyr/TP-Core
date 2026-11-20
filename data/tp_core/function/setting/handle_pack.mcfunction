# #s.v = 10 + pack index.
scoreboard players remove #s.v tp_core.tmp 10
execute store result storage tp_core:setting a.i int 1 run scoreboard players get #s.v tp_core.tmp
function tp_core:setting/menu_pack_i with storage tp_core:setting a
