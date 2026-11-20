# Test items/blocks, registered on every load so they can be tried by hand:
#   /function tp_core:item/give {id:"tp_core:item/test_wand"}  or  {id:"tp_core:item/test_block"}  (/function tp_core:debug/on first)
function tp_core:item/register {id:"tp_core:item/test_wand",on_use:"tp_core:test/item_use",on_consume:"",on_place:"",on_equip:"tp_core:test/item_equip"}
function tp_core:block/register {id:"tp_core:item/test_block",base:"minecraft:blast_furnace",on_place:"tp_core:test/block_place",on_break:"tp_core:test/block_break",on_tick:""}
function tp_core:setting/register {id:"tp_core:test_a",label:"Test A",default:1}
function tp_core:setting/register {id:"tp_core:test_b",label:"Test B",default:0}
