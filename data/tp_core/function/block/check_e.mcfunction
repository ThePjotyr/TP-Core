# Macro: base, on_tick, ...
$execute unless block ~ ~ ~ $(base) run return run function tp_core:block/lost with storage tp_core:block e
execute if data storage tp_core:block e{on_tick:""} run return 0
function tp_core:block/call_tick with storage tp_core:block e
