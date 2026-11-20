execute if score #debug tp_core.tmp matches 1 run tellraw @s "[tp_core] track start: sprint"
# Reward of event/state_sprint: fires once; call tp_core:track/rearm {what:"sprint"} when the state ends to get the next one.
function #tp_core:event/player/sprint_start
