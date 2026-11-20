# Macro: event, fn.
$function #tp_core:event/item/$(event)
execute if data storage tp_core:item cur{fn:""} run return 0
$function $(fn)
