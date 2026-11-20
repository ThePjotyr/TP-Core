# Reward of event/item_use: runs every tick a custom item is being used; only the first tick of a press dispatches.
advancement revoke @s only tp_core:event/item_use
scoreboard players add @s tp_core.use_t 0
execute store result score #i.now tp_core.tmp run time query gametime
scoreboard players operation #i.d tp_core.tmp = #i.now tp_core.tmp
scoreboard players operation #i.d tp_core.tmp -= @s tp_core.use_t
scoreboard players operation @s tp_core.use_t = #i.now tp_core.tmp
execute if score #i.d tp_core.tmp matches 2.. run function tp_core:item/held_dispatch {event:"use"}
