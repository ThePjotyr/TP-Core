# Head is out; put the block in front of it, then retract.
execute in minecraft:overworld run setblock 5 100 21 minecraft:glass
execute in minecraft:overworld positioned 5.5 100.5 21.5 run function tp_core:block/spawn with storage tp_core:block p
execute in minecraft:overworld run setblock 5 100 18 minecraft:air
