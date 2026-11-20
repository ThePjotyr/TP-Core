# Settings: defaults, trigger decoding, event payload, menu actions. A stand-in entity plays the player.
function tp_core:setting/register {id:"tp_core:test_a",label:"Test A",default:1}
function tp_core:setting/register {id:"tp_core:test_b",label:"Test B",default:0}
execute in minecraft:overworld positioned 6 100 3 summon armor_stand run function tp_core:test/setting_stand
