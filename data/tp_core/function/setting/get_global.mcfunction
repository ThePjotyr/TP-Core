# Macro: id. Value of a global setting, or its default.
$execute if data storage tp_core:global settings."$(id)" run return run data get storage tp_core:global settings."$(id)"
$execute if data storage tp_core:registry settings.by_id."$(id)" run return run data get storage tp_core:registry settings.by_id."$(id)".default
return 0
