# Macro: label, sfx, st, n.
$data modify storage tp_core:setting dlg.actions append value {label:"$(label)$(sfx): $(st)",action:{type:"minecraft:run_command",command:"trigger tp_core.setting set $(n)"}}
