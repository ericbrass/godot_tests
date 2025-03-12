extends Node2D

@onready var animation_player = $player/Sprite2D/AnimationPlayer
@onready var pipe = preload("res://scenes/pipe.tscn")

@onready var cloud_1 = preload("res://scenes/cloud_1.tscn")
@onready var cloud_2 = preload("res://scenes/cloud_2.tscn")
@onready var cloud_3 = preload("res://scenes/cloud_3.tscn")
@onready var cloud_4 = preload("res://scenes/cloud_4.tscn")
@onready var cloudArray :Array = [cloud_1, cloud_2, cloud_3, cloud_4]

var current_score :int = 0
var is_game_over = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# hide game over and restart
	%mainLabel.visible = false
	%restartButton.visible = false
	
	# set and start timers
	$pipeSpawnTimer.wait_time = 4.0
	$pipeSpawnTimer.start()
	$cloudSpawnTimer.wait_time = 6.0
	$cloudSpawnTimer.start()
	#connect signals
	Signals.playerDied.connect(game_over)
	Signals.playerScored.connect(increase_score)
	#set score to 0
	$scoreLabel.text = str(current_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tap") and is_game_over == false:
		animation_player.play("jump")

func _on_world_border_body_entered(body: Node2D) -> void:
	game_over()

func _on_pipe_spawn_timer_timeout() -> void:
	var new_pipe = pipe.instantiate()
	new_pipe.position.x = 550
	new_pipe.position.y = randi_range(200,600)
	add_child(new_pipe)

func _on_cloud_spawn_timer_timeout() -> void:
	var cloud_to_be_spawned = cloudArray.pick_random().instantiate()
	#cloud_to_be_spawned.instantiate()
	cloud_to_be_spawned.position.x = 600
	cloud_to_be_spawned.position.y = randi_range(200,700)
	add_child(cloud_to_be_spawned)

func game_over():
	is_game_over = true
	$player.queue_free()
	$gameOverLayer.visible = true
	%mainLabel.text = "Game Over\nFinal Score: " + str(current_score)
	%mainLabel.visible = true
	%restartButton.visible = true
	#get_tree().paused = true

func increase_score():
	current_score += 1
	$scoreLabel.text = str(current_score)
	if $pipeSpawnTimer.wait_time > 3:
		$pipeSpawnTimer.wait_time -= 0.05

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
