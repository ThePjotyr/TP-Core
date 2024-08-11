summon armor_stand ~ ~ ~ {Tags:["tp.armor.temp"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b}
$data modify entity @e[type=armor_stand,tag=tp.armor.temp,limit=1,sort=nearest,distance=..0.5] ArmorItems set from storage $(storage) Players[0].armor

item replace entity @s armor.feet from entity @e[type=armor_stand,tag=tp.armor.temp,limit=1,sort=nearest,distance=..0.5] armor.feet
item replace entity @s armor.legs from entity @e[type=armor_stand,tag=tp.armor.temp,limit=1,sort=nearest,distance=..0.5] armor.legs
item replace entity @s armor.chest from entity @e[type=armor_stand,tag=tp.armor.temp,limit=1,sort=nearest,distance=..0.5] armor.chest
item replace entity @s armor.head from entity @e[type=armor_stand,tag=tp.armor.temp,limit=1,sort=nearest,distance=..0.5] armor.head

kill @e[type=armor_stand,tag=tp.armor.temp,limit=1,sort=nearest,distance=..0.5]
function tp_armor:delete_armor