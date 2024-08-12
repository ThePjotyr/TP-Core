#PLAYER ID
execute as @a unless score @s tp.id matches -2147483648..2147483647 run function main:id_set

#PLAYER ROTATION
execute if entity @a as @a store result score @s tp.rotation.y run data get entity @s Rotation[1] 1

#PLAYER HEIGHT
execute as @a store result score @s tp.height run data get entity @s Pos[1]