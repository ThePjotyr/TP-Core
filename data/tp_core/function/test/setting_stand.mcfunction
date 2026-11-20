scoreboard players set @s tp_core.id 9998
execute store result score #t.s_a tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_a"}
execute store result score #t.s_b tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_b"}
scoreboard players set @s tp_core.setting 100
function tp_core:setting/handle
execute store result score #t.s_a2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_a"}
scoreboard players set @s tp_core.setting 103
function tp_core:setting/handle
execute store result score #t.s_b2 tp_core.tmp run function tp_core:setting/get {id:"tp_core:test_b"}
scoreboard players set @s tp_core.setting 9999
function tp_core:setting/handle
kill @s
