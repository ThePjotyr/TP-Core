# Macro: what. Opts @s out and clears a pending grant.
$scoreboard players set @s tp_core.t_$(what) 0
$advancement revoke @s only tp_core:event/state_$(what)
