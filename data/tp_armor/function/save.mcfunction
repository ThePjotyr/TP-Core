$data modify storage $(storage) NewPlayer set value {ID:0, armor:[{},{},{},{}]}

$data modify storage $(storage) NewPlayer.armor[0] set from entity @s Inventory.[{Slot:100b}]
$data modify storage $(storage) NewPlayer.armor[1] set from entity @s Inventory.[{Slot:101b}]
$data modify storage $(storage) NewPlayer.armor[2] set from entity @s Inventory.[{Slot:102b}]
$data modify storage $(storage) NewPlayer.armor[3] set from entity @s Inventory.[{Slot:103b}]
$execute store result storage $(storage) NewPlayer.ID int 1 run scoreboard players get @s tp.id

$data modify storage $(storage) Players append from storage $(storage) NewPlayer
$data remove storage $(storage) NewPlayer

tag @s add tp.inv.armor.stored