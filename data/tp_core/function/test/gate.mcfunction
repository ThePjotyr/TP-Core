# Waits until the forceloaded chunk is loaded (slow machines), then starts the chunk-dependent tests.
execute in minecraft:overworld if loaded 0 100 0 run return run function tp_core:test/begin
function tp_core:queue/after {delay:20,fn:"tp_core:test/gate"}
