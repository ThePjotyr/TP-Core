# Called once the forceloaded chunk is loaded; schedules everything that needs it.
function tp_core:queue/after {delay:20,fn:"tp_core:test/start_loop"}
function tp_core:queue/after {delay:420,fn:"tp_core:test/verify"}
function tp_core:queue/after {delay:30,fn:"tp_core:test/ray_test"}
function tp_core:queue/after {delay:40,fn:"tp_core:test/item_test"}
function tp_core:queue/after {delay:50,fn:"tp_core:test/block_test"}
function tp_core:queue/after {delay:60,fn:"tp_core:test/setting_test"}
function tp_core:queue/after {delay:70,fn:"tp_core:test/equip_test"}
function tp_core:queue/after {delay:80,fn:"tp_core:test/track_test"}
function tp_core:queue/after {delay:140,fn:"tp_core:test/push_test"}
function tp_core:queue/after {delay:290,fn:"tp_core:test/push_check"}
