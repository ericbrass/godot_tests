extends Node2D

# have to put these in onready statements for it to work
@onready var enemyRat = preload("res://scenes/enemies/enemyRat.tscn")
@onready var enemyGhost = preload("res://scenes/enemies/enemyGhost.tscn")
@onready var enemyGoblin = preload("res://scenes/enemies/enemyGoblin.tscn")
@onready var enemyArray :Array = [enemyRat, enemyGhost, enemyGoblin]

# variable declarations
var enemyCounter :int = 0
var enemyToBeSpawned :int = 0

#spawn the enemies on a timer
func _on_enemy_spawn_timer_timeout() -> void:
	var enemy_to_be_spawned = enemyArray[enemyToBeSpawned].instantiate()
	
	# old way to do it : var enemy_to_be_spawned = enemyRat.instantiate()
	
	enemy_to_be_spawned.position.x = position.x
	enemy_to_be_spawned.position.y = position.y + randi_range(-30,30)
	
	get_parent().add_child(enemy_to_be_spawned)

	enemyCounter += 1
	if enemyCounter >= 5 and enemyToBeSpawned == 0:
		enemyToBeSpawned += 1
	elif enemyCounter >=15 and enemyToBeSpawned == 1:
		enemyToBeSpawned += 1
