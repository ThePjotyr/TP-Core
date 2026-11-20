# Macro: pack (id given to setting/pack first), id ("ns:name", unique), label (no double quotes), default (0 or 1), scope ("player" or "global").
# Call from a function in #tp_core:register. Bad or duplicate entries are rejected with setting/invalid and not registered.
$data modify storage tp_core:setting reg set value {pack:"$(pack)",id:"$(id)",label:"$(label)",default:$(default),scope:"$(scope)"}
$execute unless data storage tp_core:registry settings.packs."$(pack)" run return run function tp_core:setting/invalid {why:"register $(id): pack $(pack) is not registered"}
$execute if data storage tp_core:registry settings.by_id."$(id)" run return run function tp_core:setting/invalid {why:"register $(id): duplicate id"}
$execute unless data storage tp_core:setting reg{default:0} unless data storage tp_core:setting reg{default:1} run return run function tp_core:setting/invalid {why:"register $(id): default must be 0 or 1"}
$execute unless data storage tp_core:setting reg{scope:"player"} unless data storage tp_core:setting reg{scope:"global"} run return run function tp_core:setting/invalid {why:"register $(id): scope must be player or global"}
data modify storage tp_core:registry settings.list append from storage tp_core:setting reg
$data modify storage tp_core:registry settings.by_id."$(id)" set from storage tp_core:setting reg
