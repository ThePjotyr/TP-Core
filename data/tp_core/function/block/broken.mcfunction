# Macro: base, id. Swaps the vanilla drop for the custom item, fires on_break, removes the display.
# Removes plain drops of the base item within 3 blocks (not items carrying tp_core data). Works when the base block drops itself (furnaces, chests...);
# shortcut: a base whose drop differs (stone -> cobblestone) or that pistons can push would leave a dupe; pick a non-pushable block-entity base.
$kill @e[type=item,distance=..3,nbt={Item:{id:"$(base)"}},nbt=!{Item:{components:{"minecraft:custom_data":{tp_core:{}}}}}]
$loot spawn ~ ~ ~ loot $(id)
scoreboard players remove #b.count tp_core.tmp 1
execute if score #b.count tp_core.tmp matches ..-1 run scoreboard players set #b.count tp_core.tmp 0
execute unless data storage tp_core:block e{on_break:""} run function tp_core:block/call_break with storage tp_core:block e
kill @s
