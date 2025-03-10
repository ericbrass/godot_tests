extends Area2D

@export var fireballScene : PackedScene

# Variable Declarations
var enemyArray : Array[CharacterBody2D] = []
var towerTargetMode : String = "closest"
var targetModes : Array [String] = ["closest","farthest","weakest","strongest"]
var attackSpeed : float = 2.0
var attackDamage : float = 5.0
var attackRange : float = 200.0

func _ready() -> void:
	$towerAttackTimer.wait_time = attackSpeed
	$towerAttackTimer.autostart = true
	$towerAttackTimer.start()
	$CollisionShape2D.shape.radius = attackRange

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
		match towerTargetMode:
			"closest":
				return closest_enemy()
			"farthest":
				return farthest_enemy()
			"weakest":
				return weakest_enemy()
			"strongest":
				return strongest_enemy()

func closest_enemy():
	var closestEnemy
	if (!enemyArray.is_empty()):
		closestEnemy = enemyArray[0]
		for i in enemyArray:
			if (i.position.distance_to(position)) < closestEnemy.position.distance_to(position):
				closestEnemy = i
	return closestEnemy

func farthest_enemy():
	var farthestEnemy
	if (!enemyArray.is_empty()):
		farthestEnemy = enemyArray[0]
		for i in enemyArray:
			if (i.position.distance_to(position)) > farthestEnemy.position.distance_to(position):
				farthestEnemy = i
	return farthestEnemy

func weakest_enemy():
	var weakestEnemy
	if (!enemyArray.is_empty()):
		weakestEnemy = enemyArray[0]
		for i in enemyArray:
			if (i.health < weakestEnemy.health):
				weakestEnemy = i
	return weakestEnemy

func strongest_enemy():
	var strongestEnemy
	if (!enemyArray.is_empty()):
		strongestEnemy = enemyArray[0]
		for i in enemyArray:
			if (i.health > strongestEnemy.health):
				strongestEnemy = i
	return strongestEnemy

func shoot(target):
	var newFireball = fireballScene.instantiate()
	newFireball.damage = attackDamage
	newFireball.position = position
	newFireball.target = target
	get_parent().add_child(newFireball)

func _on_option_button_item_selected(index: int) -> void:
	towerTargetMode = targetModes[index]

func _on_upgrade_damage_pressed() -> void:
	if ( global.gold >= 5 ):
		global.gold -= 5
		self.attackDamage += 3.0
	else:
		print ("not enough gold!")

func _on_upgrade_range_pressed() -> void:
	if ( global.gold >= 3 ):
		global.gold -= 3
		$CollisionShape2D.shape.radius += 50.0
	else:
		print ("not enough gold!")

func _on_upgrade_speed_pressed() -> void:
	if ( global.gold >= 3 ):
		global.gold -= 3
		self.attackSpeed -= .5
	else:
		print ("not enough gold!")
