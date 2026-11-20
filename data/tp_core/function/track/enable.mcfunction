# Macro: what (sprint, sneak, slot0..slot8). Opts @s in: the engine then evaluates one cheap predicate for @s until the start event fires;
# it fires #tp_core:event/player/<what>_start, and #tp_core:event/player/<what>_end when the state stops (then re-arms itself).
$execute unless score @s tp_core.t_$(what) matches 2 run scoreboard players set @s tp_core.t_$(what) 1
