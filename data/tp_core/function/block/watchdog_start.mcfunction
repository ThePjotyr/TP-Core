# Keeps exactly one watchdog queued while custom blocks exist.
execute if score #b.wd tp_core.tmp matches 1 run return 0
scoreboard players set #b.wd tp_core.tmp 1
function tp_core:queue/after {delay:200,fn:"tp_core:block/watchdog"}
