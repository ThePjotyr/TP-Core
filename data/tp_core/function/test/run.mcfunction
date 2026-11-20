# Self-test: /function tp_core:test/run  (prints PASS/FAIL ~6s later via the server log/console)
# Checks: queue ordering, macro data passing, as-server callbacks, queue emptiness, loop interval/leave/self-termination.
scoreboard players set #t.order tp_core.tmp 0
scoreboard players set #t.ten tp_core.tmp 10
scoreboard players set #t.k tp_core.tmp 0
scoreboard players set #t.loop tp_core.tmp 0

function tp_core:queue/push {delay:6,fn:"tp_core:test/cb_a",as:-1,data:{}}
function tp_core:queue/push {delay:2,fn:"tp_core:test/cb_b",as:-1,data:{}}
function tp_core:queue/push {delay:4,fn:"tp_core:test/cb_macro",as:-1,data:{k:7}}

# The marker needs a loaded chunk, so force-load and start the loop test a few ticks later.
execute in minecraft:overworld run forceload add 0 0
function tp_core:queue/after {delay:60,fn:"tp_core:test/start_loop"}
function tp_core:queue/after {delay:480,fn:"tp_core:test/verify"}
function tp_core:queue/after {delay:70,fn:"tp_core:test/ray_test"}
function tp_core:queue/after {delay:80,fn:"tp_core:test/item_test"}
function tp_core:queue/after {delay:90,fn:"tp_core:test/block_test"}
function tp_core:queue/after {delay:100,fn:"tp_core:test/setting_test"}
function tp_core:queue/after {delay:110,fn:"tp_core:test/equip_test"}
function tp_core:queue/after {delay:120,fn:"tp_core:test/track_test"}
