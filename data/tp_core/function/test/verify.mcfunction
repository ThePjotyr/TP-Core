scoreboard players set #t.fail tp_core.tmp 0
execute unless score #t.order tp_core.tmp matches 231 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.order tp_core.tmp matches 231 run say [tp_core test] FAIL queue order (expected 231, see #t.order)
execute unless score #t.k tp_core.tmp matches 7 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.k tp_core.tmp matches 7 run say [tp_core test] FAIL macro data not passed
execute unless score #t.loop tp_core.tmp matches 5 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.loop tp_core.tmp matches 5 run say [tp_core test] FAIL loop did not run exactly 5 times (see #t.loop)
execute unless score #l.armed tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #l.armed tp_core.tmp matches 0 run say [tp_core test] FAIL loop pulse did not stop
execute if data storage tp_core:queue entries[0] run scoreboard players set #t.fail tp_core.tmp 1
execute if data storage tp_core:queue entries[0] run say [tp_core test] FAIL queue not empty
execute unless score #t.rayhit tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.rayhit tp_core.tmp matches 1 run say [tp_core test] FAIL ray did not reach the wall
execute unless score #t.raycalls tp_core.tmp matches 10..12 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.raycalls tp_core.tmp matches 10..12 run say [tp_core test] FAIL ray sample count (expected ~10 for z 0.5..5)
execute unless score #t.rayshort tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.rayshort tp_core.tmp matches 0 run say [tp_core test] FAIL short ray overshot
execute unless score #t.raystop tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.raystop tp_core.tmp matches 1 run say [tp_core test] FAIL ray did not stop on #r.stop
execute unless score #t.item_use tp_core.tmp matches 2 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.item_use tp_core.tmp matches 2 run say [tp_core test] FAIL item use handler count (expected 2: direct + off hand)
execute unless score #t.item_equip tp_core.tmp matches 2 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.item_equip tp_core.tmp matches 2 run say [tp_core test] FAIL item equip count (expected 2)
execute unless score #t.b_disp tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.b_disp tp_core.tmp matches 1 run say [tp_core test] FAIL block display not spawned by place
execute unless score #t.b_count tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.b_count tp_core.tmp matches 1 run say [tp_core test] FAIL block count after place
execute unless score #t.b_place tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.b_place tp_core.tmp matches 1 run say [tp_core test] FAIL block on_place count
execute unless score #t.b_tick tp_core.tmp matches 1.. run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.b_tick tp_core.tmp matches 1.. run say [tp_core test] FAIL block on_tick never ran
execute unless score #t.b_break tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.b_break tp_core.tmp matches 1 run say [tp_core test] FAIL block on_break count
execute if entity @e[type=item_display,tag=tp_core.block] run scoreboard players set #t.fail tp_core.tmp 1
execute if entity @e[type=item_display,tag=tp_core.block] run say [tp_core test] FAIL display left behind
execute unless score #b.count tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #b.count tp_core.tmp matches 0 run say [tp_core test] FAIL block count not back to 0
execute unless score #b.wd tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #b.wd tp_core.tmp matches 0 run say [tp_core test] FAIL watchdog did not stop
execute unless score #t.s_a tp_core.tmp matches 1 run say [tp_core test] FAIL setting default a
execute unless score #t.s_b tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.s_b tp_core.tmp matches 0 run say [tp_core test] FAIL setting default b
execute unless score #t.s_a2 tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.s_a2 tp_core.tmp matches 0 run say [tp_core test] FAIL setting a after trigger 100
execute unless score #t.s_b2 tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.s_b2 tp_core.tmp matches 1 run say [tp_core test] FAIL setting b after trigger 103
execute unless data storage tp_core:setting changed{id:"tp_core:test_b",value:1} run scoreboard players set #t.fail tp_core.tmp 1
execute unless data storage tp_core:setting changed{id:"tp_core:test_b",value:1} run say [tp_core test] FAIL setting changed payload
execute unless data storage tp_core:setting dlg.actions[0].action{command:"trigger tp_core.setting set 101"} run scoreboard players set #t.fail tp_core.tmp 1
execute unless data storage tp_core:setting dlg.actions[0].action{command:"trigger tp_core.setting set 101"} run say [tp_core test] FAIL setting menu action 0
execute unless data storage tp_core:setting dlg.actions[1].action{command:"trigger tp_core.setting set 102"} run scoreboard players set #t.fail tp_core.tmp 1
execute unless data storage tp_core:setting dlg.actions[1].action{command:"trigger tp_core.setting set 102"} run say [tp_core test] FAIL setting menu action 1
execute unless score #t.e_tag tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.e_tag tp_core.tmp matches 1 run say [tp_core test] FAIL equipment stored tag not set / not cleared after restore
execute unless score #t.e_clear tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.e_clear tp_core.tmp matches 1 run say [tp_core test] FAIL equipment clear
execute unless score #t.e_a tp_core.tmp matches 7 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.e_a tp_core.tmp matches 7 run say [tp_core test] FAIL equipment restore lost item components
execute unless score #t.e_feet tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.e_feet tp_core.tmp matches 1 run say [tp_core test] FAIL equipment restore feet
execute unless score #t.e_chest tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.e_chest tp_core.tmp matches 1 run say [tp_core test] FAIL equipment second save overwrote
execute unless score #t.e_left tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.e_left tp_core.tmp matches 0 run say [tp_core test] FAIL equipment save left behind
execute unless score #t.t_on tp_core.tmp matches 1 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.t_on tp_core.tmp matches 1 run say [tp_core test] FAIL track enable
execute unless score #t.t_off tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.t_off tp_core.tmp matches 0 run say [tp_core test] FAIL track disable
execute if entity @e[type=item,tag=tp_core_t_vanilla] run scoreboard players set #t.fail tp_core.tmp 1
execute if entity @e[type=item,tag=tp_core_t_vanilla] run say [tp_core test] FAIL vanilla drop of the base block was not removed
execute unless entity @e[type=item,tag=tp_core_t_custom] run scoreboard players set #t.fail tp_core.tmp 1
execute unless entity @e[type=item,tag=tp_core_t_custom] run say [tp_core test] FAIL a custom item next to the block was removed
execute unless score #t.p_g1 tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.p_g1 tp_core.tmp matches 0 run say [tp_core test] FAIL pushed glass copy was not removed
execute unless score #t.p_g2 tp_core.tmp matches 0 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.p_g2 tp_core.tmp matches 0 run say [tp_core test] FAIL pulled glass copy was not removed
execute unless score #t.p_items tp_core.tmp matches 2 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.p_items tp_core.tmp matches 2 run say [tp_core test] FAIL piston tests: expected 2 custom items (see #t.p_items)
execute unless score #t.p_break tp_core.tmp matches 2 run scoreboard players set #t.fail tp_core.tmp 1
execute unless score #t.p_break tp_core.tmp matches 2 run say [tp_core test] FAIL piston tests: on_break count
execute if score #t.fail tp_core.tmp matches 0 run say [tp_core test] PASS
