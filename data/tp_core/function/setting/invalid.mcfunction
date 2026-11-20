# Macro: why. Rejects a bad settings call: tells everyone, keeps the text in storage tp_core:setting errors, returns 0.
$data modify storage tp_core:setting errors append value "$(why)"
$tellraw @a {"text":"[tp_core] settings: $(why)","color":"red"}
return 0
