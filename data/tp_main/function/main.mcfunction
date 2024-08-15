#PLAYER ID
execute as @a unless score @s tp.id matches -2147483648..2147483647 run function main:id_set

#PLAYER RUNNING LAG
execute as @a unless score @s tp.running.lag matches -2147483648..2147483647 run scoreboard players set @s tp.running.lag 20
execute if entity @a[predicate=tp_predicate:is_sprint,scores={tp.running.lag=..19}] as @a[predicate=tp_predicate:is_sprint,scores={tp.running.lag=..19}] run scoreboard players set @s tp.running.lag 20
execute if entity @a[scores={tp.running.lag=1..}] as @a[scores={tp.running.lag=1..}] run scoreboard players remove @s tp.running.lag 1

#PLAYER ROTATION
execute if entity @a as @a store result score @s tp.rotation.y run data get entity @s Rotation[1] 1

#PLAYER HEIGHT
execute as @a store result score @s tp.height run data get entity @s Pos[1]