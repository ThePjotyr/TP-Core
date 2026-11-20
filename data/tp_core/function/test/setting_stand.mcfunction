scoreboard players set @s tp_core.id 9998
# repeatable on a world that already ran it
data remove storage tp_core:players p9998.settings
data remove storage tp_core:global settings."tp_core:test_g"
# The test pack is registered only for this run (never in the real menu) and removed again at the end. Indexes follow what is registered already.
execute store result score #t.sb tp_core.tmp run data get storage tp_core:registry settings.list
execute store result score #t.pb tp_core.tmp run data get storage tp_core:registry settings.pack_list
function tp_core:setting/pack {id:"tp_core_test",name:"TP-Core test"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:test_a",label:"Test A",default:1,scope:"player"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:test_b",label:"Test B",default:0,scope:"player"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:test_g",label:"Test G",default:1,scope:"global"}
# trigger for "set test_a to 0" = 100 + 2*sb ; "set test_b to 1" = that + 3
scoreboard players operation #t.ta tp_core.tmp = #t.sb tp_core.tmp
scoreboard players operation #t.ta tp_core.tmp += #t.ta tp_core.tmp
scoreboard players add #t.ta tp_core.tmp 100
scoreboard players operation #t.tb tp_core.tmp = #t.ta tp_core.tmp
scoreboard players add #t.tb tp_core.tmp 3
scoreboard players operation #t.pt tp_core.tmp = #t.pb tp_core.tmp
scoreboard players add #t.pt tp_core.tmp 10
execute store result score #t.s_a tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_a"}
execute store result score #t.s_b tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_b"}
execute store result score #t.s_g tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_g"}
# player settings through the trigger; 9999 = out of range
scoreboard players operation @s tp_core.setting = #t.ta tp_core.tmp
function tp_core:setting/handle
execute store result score #t.s_a2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_a"}
scoreboard players operation @s tp_core.setting = #t.tb tp_core.tmp
function tp_core:setting/handle
execute store result score #t.s_b2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_b"}
execute store success score #t.chg tp_core.tmp if data storage tp_core:setting changed{id:"tp_core:test_b",value:1,scope:"player"}
scoreboard players set @s tp_core.setting 9999
function tp_core:setting/handle
# the pack page built by the last change
execute store success score #t.m0 tp_core.tmp if data storage tp_core:setting dlg.actions[{label:"Test A: OFF"}]
execute store success score #t.m1 tp_core.tmp if data storage tp_core:setting dlg.actions[{label:"Test B: ON"}]
execute store success score #t.m2 tp_core.tmp if data storage tp_core:setting dlg.actions[{label:"Test G (operators): ON"}]
execute store success score #t.m3 tp_core.tmp unless data storage tp_core:setting dlg.actions[3]
# global settings: debug mirrors into #debug; the trigger (any player) cannot change a global one
execute store result score #t.dbg0 tp_core.tmp run function tp_core:setting/get {id:"tp_core:debug"}
function tp_core:setting/gset {id:"tp_core:debug",value:1}
execute store result score #t.dbg1 tp_core.tmp run function tp_core:setting/get {id:"tp_core:debug"}
scoreboard players operation #t.dbg1f tp_core.tmp = #debug tp_core.tmp
scoreboard players set @s tp_core.setting 100
function tp_core:setting/handle
execute store result score #t.dbg2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:debug"}
function tp_core:setting/gset {id:"tp_core:debug",value:0}
execute store result score #t.dbg3 tp_core.tmp run function tp_core:setting/get {id:"tp_core:debug"}
scoreboard players operation #t.dbg3f tp_core.tmp = #debug tp_core.tmp
execute if score #t.dbg0 tp_core.tmp matches 1 run function tp_core:setting/gset {id:"tp_core:debug",value:1}
function tp_core:setting/gset {id:"tp_core:test_g",value:0}
execute store result score #t.s_g2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_g"}
# rejected calls (6 errors expected, nothing registered)
function tp_core:setting/register {pack:"nope",id:"tp_core:bad1",label:"x",default:1,scope:"player"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:bad2",label:"x",default:2,scope:"player"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:bad3",label:"x",default:1,scope:"world"}
function tp_core:setting/register {pack:"tp_core_test",id:"tp_core:test_a",label:"dup",default:1,scope:"player"}
function tp_core:setting/gset {id:"tp_core:test_a",value:1}
function tp_core:setting/set {id:"tp_core:test_a",value:5}
# menus: root first button is TP-Core; the trigger opens a pack page
function tp_core:setting/menu
execute store success score #t.r0 tp_core.tmp if data storage tp_core:setting dlg.actions[{label:"TP-Core"}]
scoreboard players operation @s tp_core.setting = #t.pt tp_core.tmp
function tp_core:setting/handle
execute store success score #t.t1 tp_core.tmp if data storage tp_core:setting dlg{title:"TP-Core test"}
scoreboard players set @s tp_core.setting 10
function tp_core:setting/handle
execute store success score #t.t0 tp_core.tmp if data storage tp_core:setting dlg{title:"TP-Core"}
# unregister the test pack again
data remove storage tp_core:registry settings.list[-1]
data remove storage tp_core:registry settings.list[-1]
data remove storage tp_core:registry settings.list[-1]
data remove storage tp_core:registry settings.pack_list[-1]
data remove storage tp_core:registry settings.packs."tp_core_test"
data remove storage tp_core:registry settings.by_id."tp_core:test_a"
data remove storage tp_core:registry settings.by_id."tp_core:test_b"
data remove storage tp_core:registry settings.by_id."tp_core:test_g"
execute store success score #t.clean tp_core.tmp unless data storage tp_core:registry settings.packs."tp_core_test"
kill @s
