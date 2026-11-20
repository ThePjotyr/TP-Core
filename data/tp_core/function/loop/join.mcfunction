# Macro: loop. Makes @s a member of the loop and starts the pulse if it is not running.
$tag @s add tp_core.loop.$(loop)
function tp_core:loop/arm
