extends Area2D

var speed : float = 300
var target : Node2D
var damage : float = 5.0

func _process(delta: float) -> void:
	if (target and is_instance_valid(target)):
		var direction = (target.global_position - global_position).normalized()
		position += direction * speed * delta
	else:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body == target:
		body.take_damage(damage)
		queue_free()
