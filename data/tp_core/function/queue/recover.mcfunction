# After load: pending schedules may be gone; run once next tick if anything is queued.
scoreboard players set #q.sched tp_core.tmp 0
execute if data storage tp_core:queue entries[0] run scoreboard players set #q.sched tp_core.tmp 1
execute if data storage tp_core:queue entries[0] run schedule function tp_core:queue/run 1t replace
