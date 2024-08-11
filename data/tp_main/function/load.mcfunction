#SCOREBOARDS
scoreboard objectives add tp.id dummy

#CONSTANTS
execute unless score #tp.count.players tp.id matches -2147483648..2147483647 run scoreboard players set #tp.count.players tp.id 1