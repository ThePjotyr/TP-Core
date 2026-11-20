execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"track end: sprint"}
scoreboard players set @s tp_core.t_sprint 1
advancement revoke @s only tp_core:event/state_sprint
advancement revoke @s only tp_core:event/state_sprint_end
function #tp_core:event/player/sprint_end
