extends Node2D

func _ready() -> void:
	$goldCount.text = "Gold " + str(global.gold)

func _process(delta: float) -> void:
	$goldCount.text = "Gold " + str(global.gold)
