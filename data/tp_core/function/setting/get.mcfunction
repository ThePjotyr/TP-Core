# Macro: id. Returns the setting's value (0/1): global settings are server-wide, player settings are read for @s. Default if never changed, 0 if unregistered.
data modify storage tp_core:setting g set value {pid:0}
execute store result storage tp_core:setting g.pid int 1 run scoreboard players get @s tp_core.id
$data modify storage tp_core:setting g.id set value "$(id)"
return run function tp_core:setting/get_ with storage tp_core:setting g
