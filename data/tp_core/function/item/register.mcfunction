# Macro: id ("ns:item/name" = the item's loot table), on_use, on_consume, on_place, on_equip (function ids, "" = none).
# Call from a function in #tp_core:register. Handlers run as the player holding/wearing the item.
$data modify storage tp_core:registry items."$(id)" set value {on_use:"$(on_use)",on_consume:"$(on_consume)",on_place:"$(on_place)",on_equip:"$(on_equip)"}
