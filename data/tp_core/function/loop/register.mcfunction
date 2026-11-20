# Macro: name (no colon), fn ("ns:path", runs as+at each member), interval (ticks), type (entity type of members, e.g. player)
# Call from a function in #tp_core:register.
$data modify storage tp_core:loops list append value {name:"$(name)",fn:"$(fn)",interval:$(interval),type:"$(type)"}
