execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track start: slot1"}
# Reward of event/state_slot1: fires once; call tp_core:track/rearm {what:"slot1"} when the state ends to get the next one.
function #tp_core:event/player/slot1_start
