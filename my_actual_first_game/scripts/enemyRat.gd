extends CharacterBody2D

@export var speed :int = 50
@export var health :int = 10

func _physics_process(delta: float) -> void:
	velocity.x = -speed
	move_and_slide()

func take_damage(amount):
	health -= amount
	$HealthBar.value = health
	if health <= 0:
		queue_free()
