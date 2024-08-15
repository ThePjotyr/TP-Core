#SCOREBOARDS
scoreboard objectives add tp.id dummy
scoreboard objectives add tp.running.lag dummy
scoreboard objectives add tp.height dummy
scoreboard objectives add tp.rotation.y dummy

#CONSTANTS
execute unless score #tp.count.players tp.id matches -2147483648..2147483647 run scoreboard players set #tp.count.players tp.id 1