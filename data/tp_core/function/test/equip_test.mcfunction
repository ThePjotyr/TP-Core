# Equipment: save, clear, double save refused, restore into the same slot, occupied slot left alone. Armor stand stands in for a player.
scoreboard players set #t.e_tag tp_core.tmp 0
scoreboard players set #t.e_clear tp_core.tmp 0
scoreboard players set #t.e_feet tp_core.tmp 0
scoreboard players set #t.e_chest tp_core.tmp 0
scoreboard players set #t.e_left tp_core.tmp 0
execute in minecraft:overworld positioned 9 100 3 summon armor_stand run function tp_core:test/equip_stand
