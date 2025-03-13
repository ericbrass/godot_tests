extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$player.position = Vector2(300,240)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		$player/playerAnimation.play("run")
