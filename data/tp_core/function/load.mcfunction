# TP-Core load. Nothing here runs per tick.
scoreboard objectives add tp_core.id dummy
scoreboard objectives add tp_core.tmp dummy
scoreboard objectives add tp_core.leave custom:leave_game
scoreboard objectives add tp_core.deaths deathCount
scoreboard objectives add tp_core.setting trigger
scoreboard objectives add tp_core.use_t dummy
scoreboard objectives add tp_core.t_sprint dummy
scoreboard objectives add tp_core.t_sneak dummy
scoreboard objectives add tp_core.t_slot0 dummy
scoreboard objectives add tp_core.t_slot1 dummy
scoreboard objectives add tp_core.t_slot2 dummy
scoreboard objectives add tp_core.t_slot3 dummy
scoreboard objectives add tp_core.t_slot4 dummy
scoreboard objectives add tp_core.t_slot5 dummy
scoreboard objectives add tp_core.t_slot6 dummy
scoreboard objectives add tp_core.t_slot7 dummy
scoreboard objectives add tp_core.t_slot8 dummy
execute unless score #next_id tp_core.id matches 1.. run scoreboard players set #next_id tp_core.id 1
data modify storage tp_core:meta version set value "2.0.0"

# Content packs re-register loops/items/settings on every load.
data modify storage tp_core:loops list set value []
data modify storage tp_core:registry items set value {}
data modify storage tp_core:registry blocks set value {}
data modify storage tp_core:registry settings set value {list:[],by_id:{}}
function tp_core:loop/register {name:"block",fn:"tp_core:block/check",interval:10,type:"item_display"}
function #tp_core:register
function #tp_core:event/load

scoreboard players enable @a tp_core.setting

# Resume persisted work after /reload or restart.
function tp_core:queue/recover
scoreboard players set #l.armed tp_core.tmp 0
function tp_core:loop/arm
