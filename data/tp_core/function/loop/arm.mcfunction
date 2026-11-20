execute if score #l.armed tp_core.tmp matches 1 run return 0
scoreboard players set #l.armed tp_core.tmp 1
schedule function tp_core:loop/pulse 1t replace
