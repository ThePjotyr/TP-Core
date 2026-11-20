# Macro: msg (no double quotes). Records "[gametime] msg | " in storage tp_core:debug text (oldest entries dropped after 150) and prints it.
execute if score #d.n tp_core.tmp matches 150.. run function tp_core:debug/clear
scoreboard players add #d.n tp_core.tmp 1
data modify storage tp_core:debug cur set value {text:""}
data modify storage tp_core:debug cur.text set from storage tp_core:debug text
execute store result storage tp_core:debug cur.t int 1 run time query gametime
$data modify storage tp_core:debug cur.msg set value "$(msg)"
function tp_core:debug/append with storage tp_core:debug cur
$tellraw @a "[tp_core] $(msg)"
