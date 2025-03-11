extends Area2D

@onready var player: CharacterBody2D = %player
@onready var main_label: Label = $mainLabel
@onready var sound1 = $scoreDing

var pipe_speed = 100.0

func _process(delta: float) -> void:
	position.x -= pipe_speed * delta
	if position.x < -400:
		queue_free()

func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	Signals.playerDied.emit()

func _on_top_pipe_body_entered(body: Node2D) -> void:
	Signals.playerDied.emit()

func _on_body_entered(body: Node2D) -> void:
	Signals.playerScored.emit()
	sound1.play()
