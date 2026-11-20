# Items: register, direct dispatch, unknown id, equip tracking, off hand read. Uses an armor stand as a stand-in for a player.
scoreboard players set #t.item_use tp_core.tmp 0
scoreboard players set #t.item_equip tp_core.tmp 0
function tp_core:item/register {id:"tp_core:item/test_wand",on_use:"tp_core:test/item_use",on_consume:"",on_place:"",on_equip:"tp_core:test/item_equip"}
function tp_core:item/dispatch {id:"tp_core:item/test_wand",event:"use"}
function tp_core:item/dispatch {id:"tp_core:item/test_wand",event:"consume"}
function tp_core:item/dispatch {id:"nope:item/none",event:"use"}
execute in minecraft:overworld positioned 3 100 3 summon armor_stand run function tp_core:test/item_stand
