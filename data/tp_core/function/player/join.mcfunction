# The advancement re-arms by revoke; the engine evaluates it only until it fires.
scoreboard players set @s tp_core.leave 0
scoreboard players enable @s tp_core.setting
function tp_core:track/rearm_all
advancement revoke @s only tp_core:event/join
function tp_core:loop/arm
function #tp_core:event/player/join
