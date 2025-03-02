extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

var health = 3

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health <= 0: 
		queue_free()
		const POWER_UP = preload("res://power_up.tscn")
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		var power_up = POWER_UP.instantiate()
		get_parent().add_child(smoke)
		get_parent().add_child(power_up)
		smoke.global_position = global_position
		power_up.global_position = global_position
