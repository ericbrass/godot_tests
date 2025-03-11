extends Sprite2D

var cloud_speed = 50.0

func _ready():
	self.z_index = 1
	self.z_as_relative = false

func _process(delta: float) -> void:
	self.position.x -= cloud_speed * delta
