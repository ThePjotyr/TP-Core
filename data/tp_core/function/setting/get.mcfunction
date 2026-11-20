# Macro: id. As the player: returns the setting's value (0/1), or its registered default if never changed.
execute store result storage tp_core:setting g.pid int 1 run scoreboard players get @s tp_core.id
$data modify storage tp_core:setting g.id set value "$(id)"
return run function tp_core:setting/get_ with storage tp_core:setting g
