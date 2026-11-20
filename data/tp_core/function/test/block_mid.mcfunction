# Display must exist and the vanilla drop is swapped when the base block goes away.
execute store result score #t.b_disp tp_core.tmp if entity @e[type=item_display,tag=tp_core.block]
scoreboard players operation #t.b_count tp_core.tmp = #b.count tp_core.tmp
# A vanilla drop and a custom item next to the block: only the vanilla one may be removed.
execute in minecraft:overworld run summon item 1.5 100.5 15.5 {Item:{id:"minecraft:blast_furnace",count:1},Tags:[tp_core_t_vanilla]}
execute in minecraft:overworld run summon item 2.5 100.5 15.5 {Item:{id:"minecraft:blast_furnace",count:1,components:{"minecraft:custom_data":{tp_core:{id:"tp_core:item/test_block"}}}},Tags:[tp_core_t_custom]}
execute in minecraft:overworld run setblock 0 100 15 minecraft:air
