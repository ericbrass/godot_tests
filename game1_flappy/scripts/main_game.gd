extends Node2D

@onready var animation_player = $player/Sprite2D/AnimationPlayer
@onready var pipe = preload("res://scenes/pipe.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pipeSpawnTimer.wait_time = 3.0
	$pipeSpawnTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tap"):
		animation_player.play("jump")

func _on_world_border_body_entered(body: Node2D) -> void:
	$player.queue_free()
	$mainLabel.text = "Game Over"

func _on_pipe_spawn_timer_timeout() -> void:
	$".".add_child(pipe)
