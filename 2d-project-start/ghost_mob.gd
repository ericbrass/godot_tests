extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

var health = 3

func _ready():
	$GhostAnimation.play("walk")
	

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	if (velocity.x >= 0.0):
		$GhostAnimation.flip_h = false
	else:
		$GhostAnimation.flip_h = true
	move_and_slide()

func take_damage():
	health -= 1
	#$GhostAnimation.play("hurt")
	match health:
		2:
			$GhostAnimation.self_modulate = Color.HOT_PINK
		1:
			$GhostAnimation.self_modulate = Color.CRIMSON
	
	if health <= 0: 
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
