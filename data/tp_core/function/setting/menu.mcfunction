# As the player: root menu, one button per registered pack (trigger value 10 + pack index).
data modify storage tp_core:setting dlg set value {type:"minecraft:multi_action",title:"TP-Core settings",columns:1,pause:0b,after_action:"none",actions:[],exit_action:{label:"Close"}}
data modify storage tp_core:setting work set from storage tp_core:registry settings.pack_list
scoreboard players set #s.i tp_core.tmp 10
function tp_core:setting/menu_pack_step
function tp_core:setting/show with storage tp_core:setting
