execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track start: slot0"}
# Reward of event/state_slot0: fires once; call tp_core:track/rearm {what:"slot0"} when the state ends to get the next one.
function #tp_core:event/player/slot0_start
