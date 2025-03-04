extends CharacterBody2D

const PLAYER_SPEED = 300

@onready var sprite = %PlayerSprite

var initial_x = 400.0
var initial_y = 300.0
var hit_points = 80

# set initial position
func _ready():
	$".".global_position = Vector2(initial_x,initial_y)

# player movement
func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * PLAYER_SPEED
	#face sprite left and right
	var left_right = direction.x
	if left_right > 0:
		sprite.flip_h = false
	elif left_right < 0:
		sprite.flip_h = true
	move_and_slide()

func _on_hurt_box_hurt(damage):
	hit_points -= damage
	print (hit_points)
