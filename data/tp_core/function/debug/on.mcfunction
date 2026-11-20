# Starts a fresh debug log. Events print to chat and are recorded; /function tp_core:debug/dump gives a click-to-copy button.
scoreboard players set #debug tp_core.tmp 1
function tp_core:debug/clear
tellraw @s "[tp_core] debug ON (log cleared). Use /function tp_core:debug/dump to copy the log."
