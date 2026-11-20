# Macro: pack. As the player: builds the dialog with one pack's settings (player and global) and shows it.
$execute unless data storage tp_core:registry settings.packs."$(pack)" run return 0
data modify storage tp_core:setting dlg set value {type:"minecraft:multi_action",title:"",columns:1,pause:0b,after_action:"none",actions:[],exit_action:{label:"Back",action:{type:"minecraft:run_command",command:"trigger tp_core.setting set 1"}}}
$data modify storage tp_core:setting dlg.title set from storage tp_core:registry settings.packs."$(pack)".name
$data modify storage tp_core:setting want set value "$(pack)"
data modify storage tp_core:setting work set from storage tp_core:registry settings.list
scoreboard players set #s.i tp_core.tmp 0
function tp_core:setting/menu_step
function tp_core:setting/show with storage tp_core:setting
