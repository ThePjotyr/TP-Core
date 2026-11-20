execute unless data storage tp_core:queue work[0] run return 0
data modify storage tp_core:queue cur set from storage tp_core:queue work[0]
data remove storage tp_core:queue work[0]
execute store result score #qs.at tp_core.tmp run data get storage tp_core:queue cur.at
execute if score #qs.at tp_core.tmp <= #qs.now tp_core.tmp run function tp_core:queue/fire with storage tp_core:queue cur
execute if score #qs.at tp_core.tmp > #qs.now tp_core.tmp run function tp_core:queue/keep
function tp_core:queue/step
