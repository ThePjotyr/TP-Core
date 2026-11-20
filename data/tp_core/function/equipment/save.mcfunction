# As the player: stores the 4 armor slots in storage tp_core:equipment (keyed by tp_core.id) and tags @s tp_core.equipment.stored.
# Fails (returns 0) if a save already exists, so a second save never overwrites the first.
execute store result storage tp_core:equipment q.pid int 1 run scoreboard players get @s tp_core.id
function tp_core:equipment/save_ with storage tp_core:equipment q
