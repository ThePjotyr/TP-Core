# Macro: what. Forces the next start event (normally the end advancement does this when the state stops).
$execute if score @s tp_core.t_$(what) matches 2 run scoreboard players set @s tp_core.t_$(what) 1
$advancement revoke @s only tp_core:event/state_$(what)
$advancement revoke @s only tp_core:event/state_$(what)_end
