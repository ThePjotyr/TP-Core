execute if score #debug tp_core.tmp matches 1 run tellraw @s "[tp_core] track start: slot2"
# Reward of event/state_slot2: fires once; call tp_core:track/rearm {what:"slot2"} when the state ends to get the next one.
function #tp_core:event/player/slot2_start
