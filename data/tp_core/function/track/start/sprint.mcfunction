execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track start: sprint"}
scoreboard players set @s tp_core.t_sprint 2
# Reward of event/state_sprint: fires once per start; the matching end advancement re-arms it when the state ends.
function #tp_core:event/player/sprint_start
