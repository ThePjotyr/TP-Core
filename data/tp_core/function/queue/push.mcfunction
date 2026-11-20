# Macro: delay (ticks), fn ("ns:path"), as (player tp_core.id, or -1 for server), data ({} or a compound passed to fn as macro args)
$scoreboard players set #q.d tp_core.tmp $(delay)
execute if score #q.d tp_core.tmp matches ..0 run scoreboard players set #q.d tp_core.tmp 1
execute store result score #q.at tp_core.tmp run time query gametime
scoreboard players operation #q.at tp_core.tmp += #q.d tp_core.tmp
$data modify storage tp_core:queue entries append value {fn:"$(fn)",as:$(as),data:$(data),at:0}
execute store result storage tp_core:queue entries[-1].at int 1 run scoreboard players get #q.at tp_core.tmp
scoreboard players operation #q.want tp_core.tmp = #q.at tp_core.tmp
function tp_core:queue/arm
