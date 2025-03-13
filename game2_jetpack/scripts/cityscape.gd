extends Node2D

@onready var city_scape: Sprite2D = $"."
var city_scape_speed :float = 100.0
var city_scape_reset :float = -1600.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	city_scape.position.x -= city_scape_speed*delta
	if city_scape.position.x <= city_scape_reset:
		city_scape.position.x = 0
