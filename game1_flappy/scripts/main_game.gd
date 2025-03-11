extends Node2D

@onready var animation_player = $player/Sprite2D/AnimationPlayer
@onready var pipe = preload("res://scenes/pipe.tscn")

var debug_counter :float = 0.0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pipeSpawnTimer.wait_time = 4.0
	$pipeSpawnTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tap"):
		animation_player.play("jump")
	debug_counter += delta
	$debugLabel.text = str(debug_counter)

func _on_world_border_body_entered(body: Node2D) -> void:
	game_over()

func _on_pipe_spawn_timer_timeout() -> void:
	var new_pipe = pipe.instantiate()
	new_pipe.position.x = 550
	new_pipe.position.y = randi_range(200,600)
	add_child(new_pipe)

func game_over():
	$player.queue_free()
	$mainLabel.text = "Game Over"
	get_tree().paused = true
