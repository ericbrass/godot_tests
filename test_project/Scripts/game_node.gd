extends Node2D

@onready var player = preload("res://Scenes/player.tscn").instantiate()

func draw_player():
	player.global_position = Vector2(400,300)
	add_child(player)
	
func _ready():
	draw_player()
