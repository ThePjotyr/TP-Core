# Macro: pid, id.
$execute if data storage tp_core:players p$(pid).settings."$(id)" run return run data get storage tp_core:players p$(pid).settings."$(id)"
$execute if data storage tp_core:registry settings.by_id."$(id)" run return run data get storage tp_core:registry settings.by_id."$(id)".default
return 0
