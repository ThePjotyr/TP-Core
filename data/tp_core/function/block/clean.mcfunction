# Macro: drop. Removes plain drops of that item within 3 blocks (not items carrying tp_core data).
$kill @e[type=item,distance=..3,nbt={Item:{id:"$(drop)"}},nbt=!{Item:{components:{"minecraft:custom_data":{tp_core:{}}}}}]
