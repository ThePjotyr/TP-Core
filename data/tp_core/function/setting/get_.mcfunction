# Macro: pid, id.
$execute if data storage tp_core:registry settings.by_id."$(id)"{scope:"global"} run return run function tp_core:setting/get_global {id:"$(id)"}
$execute if data storage tp_core:players p$(pid).settings."$(id)" run return run data get storage tp_core:players p$(pid).settings."$(id)"
$execute if data storage tp_core:registry settings.by_id."$(id)" run return run data get storage tp_core:registry settings.by_id."$(id)".default
return 0
