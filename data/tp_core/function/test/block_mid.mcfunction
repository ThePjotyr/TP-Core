# Display must exist and the vanilla drop is swapped when the base block goes away.
execute store result score #t.b_disp tp_core.tmp if entity @e[type=item_display,tag=tp_core.block]
scoreboard players operation #t.b_count tp_core.tmp = #b.count tp_core.tmp
execute in minecraft:overworld run setblock 0 100 15 minecraft:air
