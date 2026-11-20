execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track start: slot3"}
# Reward of event/state_slot3: fires once; call tp_core:track/rearm {what:"slot3"} when the state ends to get the next one.
function #tp_core:event/player/slot3_start
