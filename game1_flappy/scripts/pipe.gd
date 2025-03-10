extends Area2D

func _process(delta: float) -> void:
	position.x -= 30

func _on_body_entered(body: Node2D) -> void:
	print ("game over")
