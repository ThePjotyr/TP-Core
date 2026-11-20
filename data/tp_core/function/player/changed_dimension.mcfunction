execute if score #debug tp_core.tmp matches 1 run tellraw @s "[tp_core] event player/changed_dimension"
advancement revoke @s only tp_core:event/changed_dimension
function #tp_core:event/player/changed_dimension
