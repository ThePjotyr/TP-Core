data modify storage tp_core:queue entries append from storage tp_core:queue cur
execute if score #qs.next tp_core.tmp matches 0 run scoreboard players operation #qs.next tp_core.tmp = #qs.at tp_core.tmp
execute if score #qs.at tp_core.tmp < #qs.next tp_core.tmp run scoreboard players operation #qs.next tp_core.tmp = #qs.at tp_core.tmp
