extends Node2D

@export var spawns: Array[SpawnInfo] = []

@onready var player = get_tree().get_first_node_in_group("playerGroup")

var time = 0.0

func _on_spawn_timer_timeout():
	time += 1
	var enemy_spawns = spawns
	for i in enemy_spawns:
		if time >=
