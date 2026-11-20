execute unless data storage tp_core:loops work[0] run return 0
data modify storage tp_core:loops cur set from storage tp_core:loops work[0]
data remove storage tp_core:loops work[0]
function tp_core:loop/run_one with storage tp_core:loops cur
function tp_core:loop/step
