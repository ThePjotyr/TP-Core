# Macro: id ("ns:name"), label (shown in the dialog), default (0 or 1). Settings are on/off toggles.
# Call from a function in #tp_core:register.
$data modify storage tp_core:registry settings.list append value {id:"$(id)",label:"$(label)",default:$(default)}
$data modify storage tp_core:registry settings.by_id."$(id)" set value {default:$(default)}
