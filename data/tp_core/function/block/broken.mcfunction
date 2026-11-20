# Macro: id. Swaps the vanilla drop for the custom item, fires on_break, removes the display.
# shortcut: the vanilla drop is matched by item id only; a base that drops several different items would leave the others.
execute unless data storage tp_core:block e{drop:"none"} run function tp_core:block/clean with storage tp_core:block e
$loot spawn ~ ~ ~ loot $(id)
scoreboard players remove #b.count tp_core.tmp 1
execute if score #b.count tp_core.tmp matches ..-1 run scoreboard players set #b.count tp_core.tmp 0
execute unless data storage tp_core:block e{on_break:""} run function tp_core:block/call_break with storage tp_core:block e
kill @s
