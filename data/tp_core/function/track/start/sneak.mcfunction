execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track start: sneak"}
# Reward of event/state_sneak: fires once; call tp_core:track/rearm {what:"sneak"} when the state ends to get the next one.
function #tp_core:event/player/sneak_start
