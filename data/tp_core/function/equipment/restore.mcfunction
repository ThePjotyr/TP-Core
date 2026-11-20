# As the player: puts the saved armor back (into the same slot, or the inventory if the slot is occupied), then drops the save and the tag.
execute store result storage tp_core:equipment q.pid int 1 run scoreboard players get @s tp_core.id
function tp_core:equipment/restore_ with storage tp_core:equipment q
