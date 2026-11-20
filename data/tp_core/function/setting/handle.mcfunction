# Reward of event/setting: /trigger tp_core.setting set N. 1 = open the menu; 100+2*i+v = set registered setting i to v.
advancement revoke @s only tp_core:event/setting
scoreboard players set #s.two tp_core.tmp 2
scoreboard players operation #s.v tp_core.tmp = @s tp_core.setting
scoreboard players set @s tp_core.setting 0
scoreboard players enable @s tp_core.setting
execute if score #s.v tp_core.tmp matches 1 run return run function tp_core:setting/menu
execute unless score #s.v tp_core.tmp matches 100.. run return 0
scoreboard players remove #s.v tp_core.tmp 100
scoreboard players operation #s.i tp_core.tmp = #s.v tp_core.tmp
scoreboard players operation #s.i tp_core.tmp /= #s.two tp_core.tmp
scoreboard players operation #s.v tp_core.tmp %= #s.two tp_core.tmp
execute store result storage tp_core:setting a.i int 1 run scoreboard players get #s.i tp_core.tmp
execute store result storage tp_core:setting a.value int 1 run scoreboard players get #s.v tp_core.tmp
data remove storage tp_core:setting cur
function tp_core:setting/apply with storage tp_core:setting a
