# Macro: name, n.
$data modify storage tp_core:setting dlg.actions append value {label:"$(name)",action:{type:"minecraft:run_command",command:"trigger tp_core.setting set $(n)"}}
