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
function tp_core:queue/after {delay:20,fn:"tp_core:test/gate"}
