# Starts a fresh debug log (same as the Debug mode switch in the settings menu, plus clearing the log). Events print to chat and are recorded; /function tp_core:debug/dump gives a click-to-copy button.
function tp_core:setting/gset {id:"tp_core:debug",value:1}
function tp_core:debug/clear
tellraw @s "[tp_core] debug ON (log cleared). Use /function tp_core:debug/dump to copy the log."
