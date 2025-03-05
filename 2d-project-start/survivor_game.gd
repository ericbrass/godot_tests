extends Node2D

func spawn_mobs():
	var new_slime = preload("res://slime.tscn").instantiate()
	var new_ghost = preload("res://ghost_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_slime.global_position = %PathFollow2D.global_position
	add_child(new_slime)
	%PathFollow2D.progress_ratio = randf()
	new_ghost.global_position = %PathFollow2D.global_position
	add_child(new_ghost)

func _on_timer_timeout():
	spawn_mobs()

func _on_player_health_depleted():
	%GameOverScreen.visible = true
	$GameOverScreen/ColorRect/GameOverLabel.text = "Game Over"
	get_tree().paused = true
	
