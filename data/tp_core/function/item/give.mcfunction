# Macro: id. Gives the registered item to @s. Unknown ids do nothing.
$execute unless data storage tp_core:registry items."$(id)" run return 0
$loot give @s loot $(id)
