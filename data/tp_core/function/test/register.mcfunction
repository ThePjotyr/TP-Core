# Test items/blocks, registered on every load so they can be tried by hand:
#   /function tp_core:item/give {id:"tp_core:item/test_wand"}  or  {id:"tp_core:item/test_block"}  (/function tp_core:debug/on first)
function tp_core:item/register {id:"tp_core:item/test_wand",on_use:"tp_core:test/item_use",on_consume:"",on_place:"",on_equip:"tp_core:test/item_equip"}
function tp_core:block/register {id:"tp_core:item/test_block",base:"minecraft:blast_furnace",drop:"",light:10,pistons:0,on_place:"tp_core:test/block_place",on_break:"tp_core:test/block_break",on_tick:""}
function tp_core:setting/pack {id:"tp_core_test",name:"TP-Core test"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:test_a",label:"Test A",default:1,scope:"player"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:test_b",label:"Test B",default:0,scope:"player"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:test_g",label:"Test G",default:1,scope:"global"}
function tp_core:block/register {id:"tp_core:item/test_push",base:"minecraft:glass",drop:"none",light:10,pistons:1,on_place:"tp_core:test/push_place",on_break:"tp_core:test/push_break",on_tick:""}
