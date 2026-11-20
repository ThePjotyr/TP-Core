# Scheduled entry point. Fires due entries, keeps the rest, re-arms for the earliest remaining one.
execute store result score #qs.now tp_core.tmp run time query gametime
scoreboard players set #q.sched tp_core.tmp 0
scoreboard players set #qs.next tp_core.tmp 0
data modify storage tp_core:queue work set from storage tp_core:queue entries
data modify storage tp_core:queue entries set value []
function tp_core:queue/step
execute if score #qs.next tp_core.tmp matches 1.. run function tp_core:queue/rearm
