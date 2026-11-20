scoreboard players set @s tp_core.id 9998
# repeatable on a world that already ran it
data remove storage tp_core:players p9998.settings
data remove storage tp_core:global settings."tp_core:test_g"
# registry layout (list: 0 debug, 1 test_a, 2 test_b, 3 test_g; packs: 0 tp_core, 1 tp_core_test)
execute store result score #t.s_a tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_a"}
execute store result score #t.s_b tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_b"}
execute store result score #t.s_g tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_g"}
# player settings through the trigger: 102 = i1,v0 ; 105 = i2,v1 ; 9999 = out of range
scoreboard players set @s tp_core.setting 102
function tp_core:setting/handle
execute store result score #t.s_a2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_a"}
scoreboard players set @s tp_core.setting 105
function tp_core:setting/handle
execute store result score #t.s_b2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_b"}
execute store success score #t.chg tp_core.tmp if data storage tp_core:setting changed{id:"tp_core:test_b",value:1,scope:"player"}
scoreboard players set @s tp_core.setting 9999
function tp_core:setting/handle
# the pack menu built by the last change
execute store success score #t.m0 tp_core.tmp if data storage tp_core:setting dlg.actions[0].action{command:"trigger tp_core.setting set 103"}
execute store success score #t.m1 tp_core.tmp if data storage tp_core:setting dlg.actions[1].action{command:"trigger tp_core.setting set 104"}
execute store success score #t.m2 tp_core.tmp if data storage tp_core:setting dlg.actions[2].action{command:"function tp_core:setting/gset_i {i:3,value:0}"}
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
# menus
function tp_core:setting/menu
execute store success score #t.r0 tp_core.tmp if data storage tp_core:setting dlg.actions[0].action{command:"trigger tp_core.setting set 10"}
execute store success score #t.r1 tp_core.tmp if data storage tp_core:setting dlg.actions[1].action{command:"trigger tp_core.setting set 11"}
scoreboard players set @s tp_core.setting 11
function tp_core:setting/handle
execute store success score #t.t1 tp_core.tmp if data storage tp_core:setting dlg{title:"TP-Core test"}
scoreboard players set @s tp_core.setting 10
function tp_core:setting/handle
execute store success score #t.t0 tp_core.tmp if data storage tp_core:setting dlg{title:"TP-Core"}
kill @s
