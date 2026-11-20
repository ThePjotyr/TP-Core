# Re-arms the block loop after chunks (re)load; stops itself when no block is left.
scoreboard players set #b.wd tp_core.tmp 0
execute unless score #b.count tp_core.tmp matches 1.. run return 0
function tp_core:loop/arm
function tp_core:block/watchdog_start
