# As the player: builds the dialog from the registered settings and shows it.
data modify storage tp_core:setting dlg set value {type:"minecraft:multi_action",title:"Settings",columns:1,pause:0b,after_action:"none",actions:[],exit_action:{label:"Close"}}
data modify storage tp_core:setting work set from storage tp_core:registry settings.list
scoreboard players set #s.i tp_core.tmp 0
function tp_core:setting/menu_step
function tp_core:setting/show with storage tp_core:setting
