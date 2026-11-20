# Macro: id ("ns:item/name", the item's loot table), base (vanilla block id), on_place, on_break, on_tick (function ids, "" = none).
# Call from a function in #tp_core:register. Also registers the item (placing it creates the block).
# on_place/on_break/on_tick run as the block's item_display at its position; on_tick every 10 ticks while the chunk is loaded.
# `base` must not be in #tp_core:passable.
$data modify storage tp_core:registry blocks."$(id)" set value {base:"$(base)",on_place:"$(on_place)",on_break:"$(on_break)",on_tick:"$(on_tick)"}
$function tp_core:item/register {id:"$(id)",on_use:"",on_consume:"",on_place:"tp_core:block/place",on_equip:""}
