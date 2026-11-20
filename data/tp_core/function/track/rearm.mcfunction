# Macro: what. Call when the state ended (e.g. from a loop) so the next start fires again.
$advancement revoke @s only tp_core:event/state_$(what)
