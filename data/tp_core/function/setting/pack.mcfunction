# Macro: id (pack id, normally your namespace), name (button text in the settings menu, no double quotes).
# Call once per content pack in #tp_core:register, before its setting/register calls.
$execute if data storage tp_core:registry settings.packs."$(id)" run return run function tp_core:setting/invalid {why:"pack $(id): duplicate id"}
$data modify storage tp_core:registry settings.packs."$(id)" set value {id:"$(id)",name:"$(name)"}
$data modify storage tp_core:registry settings.pack_list append value {id:"$(id)",name:"$(name)"}
