# Macro: label, sfx, st, i, v.
$data modify storage tp_core:setting dlg.actions append value {label:"$(label)$(sfx): $(st)",action:{type:"minecraft:run_command",command:"function tp_core:setting/gset_i {i:$(i),value:$(v)}"}}
