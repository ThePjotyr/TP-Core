# Macro: delay, fn. Runs fn as/at the current player (found by tp_core.id, so it survives relogs) after delay ticks.
execute store result storage tp_core:queue self.as int 1 run scoreboard players get @s tp_core.id
$data modify storage tp_core:queue self merge value {delay:$(delay),fn:"$(fn)",data:{}}
function tp_core:queue/push with storage tp_core:queue self
