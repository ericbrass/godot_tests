extends Label

@onready var current_time = 0.00
@onready var clock_timer = $ClockTimer


func _on_clock_timer_timeout():
	current_time += 0.01
	%Clock.text = str(current_time)
	
