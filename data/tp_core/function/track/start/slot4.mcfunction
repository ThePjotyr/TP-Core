execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track start: slot4"}
scoreboard players set @s tp_core.t_slot4 2
# Reward of event/state_slot4: fires once per start; the matching end advancement re-arms it when the state ends.
function #tp_core:event/player/slot4_start
