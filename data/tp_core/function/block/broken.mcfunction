# Macro: base, id. Swaps the vanilla drop for the custom item, fires on_break, removes the display.
# shortcut: removes the nearest matching vanilla drop within 1.5 blocks (could be an unrelated dropped item); upgrade with a drop-owner check if it matters.
$kill @n[type=item,distance=..1.5,nbt={Item:{id:"$(base)"}}]
$loot spawn ~ ~ ~ loot $(id)
scoreboard players remove #b.count tp_core.tmp 1
execute if score #b.count tp_core.tmp matches ..-1 run scoreboard players set #b.count tp_core.tmp 0
execute unless data storage tp_core:block e{on_break:""} run function tp_core:block/call_break with storage tp_core:block e
kill @s
