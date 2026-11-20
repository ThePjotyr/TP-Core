# Macro: base, ... The base block is gone: with pistons enabled, first rule out / clean up a piston move.
execute unless data storage tp_core:block e{pistons:1} run return run function tp_core:block/broken with storage tp_core:block e
$execute store result score #b.defer tp_core.tmp run function tp_core:block/piston {base:"$(base)"}
execute if score #b.defer tp_core.tmp matches 1 run return 0
function tp_core:block/broken with storage tp_core:block e
