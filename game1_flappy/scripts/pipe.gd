extends Area2D

@onready var player: CharacterBody2D = %player
@onready var main_label: Label = $mainLabel

var pipe_speed = 100.0

func _process(delta: float) -> void:
	position.x -= pipe_speed * delta

func _on_body_entered(body: Node2D) -> void:
	pass
