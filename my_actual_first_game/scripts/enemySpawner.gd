extends Node2D

const ENEMY_RAT = preload("res://scenes/enemyRat.tscn")

func _on_enemy_spawn_timer_timeout() -> void:
	var enemy_to_be_spawned = ENEMY_RAT.instantiate()
	enemy_to_be_spawned.position = position
	get_parent().add_child(enemy_to_be_spawned)
