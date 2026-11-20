$execute if data storage tp_core:queue cur{as:-1} run return run function $(fn) with storage tp_core:queue cur.data
$execute as @a[scores={tp_core.id=$(as)}] at @s run function $(fn) with storage tp_core:queue cur.data
