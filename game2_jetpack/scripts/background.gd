extends Node2D

@onready var bg_city = preload("res://scenes/bg_city.tscn")
@onready var bg_buildings = preload("res://scenes/bg_buildings.tscn")
@onready var city_spawn1 = bg_city.instantiate()
@onready var city_spawn2 = bg_city.instantiate()
@onready var building_spawn1 = bg_buildings.instantiate()
@onready var building_spawn2 = bg_buildings.instantiate()

var bg_city_reset :float = -2400.0
var bg_city_width :int = 2400
var bg_buildings_reset :float = -1408.0
var bg_buildings_width :int = 1408
var game_width :float = 800.0
var building_speed :float = 50.*3
var city_speed :float = 30.0*3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_bg_initial()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_bg(delta)

func spawn_bg_initial():
	# place city tiles
	add_child(city_spawn1)
	city_spawn1.z_index = 0
	add_child(city_spawn2)
	city_spawn2.z_index = 1
	city_spawn2.position.x = bg_city_width
	add_child(building_spawn1)
	building_spawn1.z_index = 2
	add_child(building_spawn2)
	building_spawn2.z_index = 3
	building_spawn2.position.x = bg_buildings_width

func move_bg(passed_delta):
	city_spawn1.position.x -= city_speed * passed_delta
	city_spawn2.position.x -= city_speed * passed_delta
	building_spawn1.position.x -= building_speed * passed_delta
	building_spawn2.position.x -= building_speed * passed_delta
	
	if city_spawn1.position.x <= bg_city_reset:
		city_spawn1.position.x = bg_city_width
	elif city_spawn2.position.x <= bg_city_reset:
		city_spawn2.position.x = bg_city_reset
	elif building_spawn1.position.x <= bg_buildings_reset:
		building_spawn1.position.x = bg_buildings_width
	elif building_spawn2.position.x <= bg_buildings_reset:
		building_spawn2.position.x = bg_buildings_width
