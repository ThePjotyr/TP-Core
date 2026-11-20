# Self-terminating: reschedules only while some loop still has members.
scoreboard players set #l.live tp_core.tmp 0
data modify storage tp_core:loops work set from storage tp_core:loops list
function tp_core:loop/step
execute if score #l.live tp_core.tmp matches 1 run return run schedule function tp_core:loop/pulse 1t replace
scoreboard players set #l.armed tp_core.tmp 0
