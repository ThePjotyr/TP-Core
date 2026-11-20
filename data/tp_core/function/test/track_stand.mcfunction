function tp_core:track/enable {what:"slot8"}
execute store result score #t.t_on tp_core.tmp run scoreboard players get @s tp_core.t_slot8
function tp_core:track/disable {what:"slot8"}
execute store result score #t.t_off tp_core.tmp run scoreboard players get @s tp_core.t_slot8
function tp_core:track/rearm {what:"sprint"}
kill @s
