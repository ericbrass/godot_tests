extends Node

func _ready():
	spawn_player()

# insert the player into the game
func spawn_player():
	var player = preload("res://scenes/player.tscn").instantiate()
	player.global_position = Vector2(400.0,300.0)
	add_child(player)
	
