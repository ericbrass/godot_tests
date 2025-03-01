extends CharacterBody2D

@export var movement_speed = 30.0
@export var hit_points = 10.0

@onready var player = get_tree().get_first_node_in_group("playerGroup")
@onready var sprite = $mobGhostSprite

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	#face sprite left and right
	var left_right = direction.x
	if left_right > 0:
		sprite.flip_h = false
	elif left_right < 0:
		sprite.flip_h = true
	move_and_slide()

func _on_hurt_box_hurt(damage):
	hit_points -= damage
	if hit_points <= 0.0:
		queue_free()
