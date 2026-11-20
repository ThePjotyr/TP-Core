$execute unless entity @e[type=$(type),tag=tp_core.loop.$(name),limit=1] run return 0
scoreboard players set #l.live tp_core.tmp 1
$scoreboard players add #l.$(name) tp_core.tmp 1
$execute unless score #l.$(name) tp_core.tmp matches $(interval).. run return 0
$scoreboard players set #l.$(name) tp_core.tmp 0
$execute as @e[type=$(type),tag=tp_core.loop.$(name)] at @s run function $(fn)
