# In: #q.want = gametime the queue must run at. Only (re)schedules if sooner than the pending run.
execute if score #q.sched tp_core.tmp matches 1.. if score #q.sched tp_core.tmp <= #q.want tp_core.tmp run return 0
scoreboard players operation #q.sched tp_core.tmp = #q.want tp_core.tmp
execute store result score #q.now tp_core.tmp run time query gametime
scoreboard players operation #q.want tp_core.tmp -= #q.now tp_core.tmp
execute if score #q.want tp_core.tmp matches ..0 run scoreboard players set #q.want tp_core.tmp 1
execute store result storage tp_core:queue arm.delay int 1 run scoreboard players get #q.want tp_core.tmp
function tp_core:queue/arm_do with storage tp_core:queue arm
