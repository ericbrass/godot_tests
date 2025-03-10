extends CharacterBody2D

# exports so you can have different values per different enemy scenes
@export var startingHealth :int
@export var speed :int

# health variable that actually takes damage
var health :int

# set initial values
func _ready():
	$HealthBar.max_value = self.startingHealth
	$HealthBar.value = self.startingHealth
	health = self.startingHealth

# enemy movement
func _physics_process(delta: float) -> void:
	velocity.x = -speed
	move_and_slide()

func take_damage(amount):
	health -= amount
	$HealthBar.value = health
	if health <= 0:
		global.gold += 1
		queue_free()
