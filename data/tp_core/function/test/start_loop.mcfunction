function tp_core:loop/register {name:"tp_core_test",fn:"tp_core:test/loop_body",interval:2,type:"marker"}
execute in minecraft:overworld positioned 0 100 0 summon marker run function tp_core:loop/join {loop:"tp_core_test"}
