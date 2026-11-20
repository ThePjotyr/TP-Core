execute if score #debug tp_core.tmp matches 1 run function tp_core:debug/log {msg:"advancement fired: item_consume"}
advancement revoke @s only tp_core:event/item_consume
function tp_core:item/held_dispatch {event:"consume"}
