extends CharacterBody2D

@onready var sound1 = $behSound
@onready var sound2 = $gehSound
@onready var sound3 = $eeeSound
@onready var sounds :Array = [sound1, sound2, sound3]

const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("tap"):
		velocity.y = JUMP_VELOCITY
		var sound_to_be_played = sounds.pick_random()
		sound_to_be_played.play()

	move_and_slide()
