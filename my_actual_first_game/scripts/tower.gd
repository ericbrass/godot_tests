extends Area2D

@export var projectile : PackedScene

var enemyArray : Array[CharacterBody2D] = []

var targetMode : String = "closest"

var attackSpeed : float = 2.0
var attackDamage : float = 5.0

func _ready() -> void:
	$towerAttackTimer.wait_time = attackSpeed
	$towerAttackTimer.autostart = true
	$towerAttackTimer.start()

func _on_body_entered(body: Node2D) -> void:
	if (!enemyArray.has(body)):
		enemyArray.append(body)

func _on_body_exited(body: Node2D) -> void:
	if (enemyArray.has(body)):
		enemyArray.erase(body)

func _on_tower_attack_timer_timeout() -> void:
	# select a target
	var target = get_target()
	#spawn a projectile
	if (target):
		shoot(target)

func get_target():
	if enemyArray.is_empty():
		return null
	else:
		pass

func shoot(target):
	var newFireball = projectile.instantiate()
	newFireball.damage = attackDamage
	newFireball.position = position
	newFireball.target = target
	get_parent().add_child(newFireball)
