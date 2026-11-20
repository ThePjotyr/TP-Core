execute in minecraft:overworld store result score #t.p_g1 tp_core.tmp if block 0 100 21 minecraft:glass
execute in minecraft:overworld store result score #t.p_g2 tp_core.tmp if block 5 100 20 minecraft:glass
execute in minecraft:overworld store result score #t.p_g3 tp_core.tmp if block 5 100 21 minecraft:glass
execute store result score #t.p_items tp_core.tmp if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tp_core:{id:"tp_core:item/test_push"}}}}}]
