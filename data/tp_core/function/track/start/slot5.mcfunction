execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track start: slot5"}
# Reward of event/state_slot5: fires once; call tp_core:track/rearm {what:"slot5"} when the state ends to get the next one.
function #tp_core:event/player/slot5_start
