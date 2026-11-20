# Macro: id ("ns:item/name", the item's loot table), base (vanilla block id), drop, light, pistons, on_place, on_break, on_tick.
#   drop    item id the base block drops when broken ("" = same as base, "none" = it drops nothing); that drop is removed and the custom item dropped instead
#   light   brightness 0-15 of the display (a display inside an opaque block would render dark)
#   pistons 1 = remove the copy of the block that a directly adjacent piston/sticky piston moved (0 = leave it)
#   on_place/on_break/on_tick: function ids ("" = none), run as the block's item_display at its position; on_tick every 10 ticks while loaded
# Call from a function in #tp_core:register. Also registers the item (placing it creates the block).
# `base` must not be in #tp_core:passable. A block entity that drops itself (blast_furnace, chest, hopper...) is the safest base: pistons cannot move it.
$data modify storage tp_core:registry blocks."$(id)" set value {base:"$(base)",drop:"$(drop)",light:$(light),pistons:$(pistons),on_place:"$(on_place)",on_break:"$(on_break)",on_tick:"$(on_tick)"}
$execute if data storage tp_core:registry blocks."$(id)"{drop:""} run data modify storage tp_core:registry blocks."$(id)".drop set from storage tp_core:registry blocks."$(id)".base
$function tp_core:item/register {id:"$(id)",on_use:"",on_consume:"",on_place:"tp_core:block/place",on_equip:""}
