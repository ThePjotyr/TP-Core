# Loop body, as each display every 10 ticks: detect a broken base block, otherwise run on_tick.
data modify storage tp_core:block q set value {}
data modify storage tp_core:block q.id set from entity @s item.components."minecraft:custom_data".tp_core.id
function tp_core:block/check_id with storage tp_core:block q
