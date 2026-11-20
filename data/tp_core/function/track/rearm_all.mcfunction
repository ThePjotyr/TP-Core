# As the player: re-arms every state (a grant or an active state can be stale after a relog).
execute if score @s tp_core.t_sprint matches 2 run scoreboard players set @s tp_core.t_sprint 1
advancement revoke @s only tp_core:event/state_sprint
advancement revoke @s only tp_core:event/state_sprint_end
execute if score @s tp_core.t_sneak matches 2 run scoreboard players set @s tp_core.t_sneak 1
advancement revoke @s only tp_core:event/state_sneak
advancement revoke @s only tp_core:event/state_sneak_end
execute if score @s tp_core.t_slot0 matches 2 run scoreboard players set @s tp_core.t_slot0 1
advancement revoke @s only tp_core:event/state_slot0
advancement revoke @s only tp_core:event/state_slot0_end
execute if score @s tp_core.t_slot1 matches 2 run scoreboard players set @s tp_core.t_slot1 1
advancement revoke @s only tp_core:event/state_slot1
advancement revoke @s only tp_core:event/state_slot1_end
execute if score @s tp_core.t_slot2 matches 2 run scoreboard players set @s tp_core.t_slot2 1
advancement revoke @s only tp_core:event/state_slot2
advancement revoke @s only tp_core:event/state_slot2_end
execute if score @s tp_core.t_slot3 matches 2 run scoreboard players set @s tp_core.t_slot3 1
advancement revoke @s only tp_core:event/state_slot3
advancement revoke @s only tp_core:event/state_slot3_end
execute if score @s tp_core.t_slot4 matches 2 run scoreboard players set @s tp_core.t_slot4 1
advancement revoke @s only tp_core:event/state_slot4
advancement revoke @s only tp_core:event/state_slot4_end
execute if score @s tp_core.t_slot5 matches 2 run scoreboard players set @s tp_core.t_slot5 1
advancement revoke @s only tp_core:event/state_slot5
advancement revoke @s only tp_core:event/state_slot5_end
execute if score @s tp_core.t_slot6 matches 2 run scoreboard players set @s tp_core.t_slot6 1
advancement revoke @s only tp_core:event/state_slot6
advancement revoke @s only tp_core:event/state_slot6_end
execute if score @s tp_core.t_slot7 matches 2 run scoreboard players set @s tp_core.t_slot7 1
advancement revoke @s only tp_core:event/state_slot7
advancement revoke @s only tp_core:event/state_slot7_end
execute if score @s tp_core.t_slot8 matches 2 run scoreboard players set @s tp_core.t_slot8 1
advancement revoke @s only tp_core:event/state_slot8
advancement revoke @s only tp_core:event/state_slot8_end
