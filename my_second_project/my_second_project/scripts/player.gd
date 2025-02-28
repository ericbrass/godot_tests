extends CharacterBody2D

const PLAYER_SPEED = 300

# player movement
func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * PLAYER_SPEED
	#face player left and right
	if (velocity.x < 0.0):
		$PlayerSprite.flip_h = true
	else:
		$PlayerSprite.flip_h = false
	move_and_slide()
