extends Control

signal power_level

onready var textProg = $CanvasLayer/TextureProgress


func start_meter():
	$Timer.start()
	textProg.value = 0
	
func stop_meter():
	$Timer.stop()


func _on_Timer_timeout():
	textProg.value += 1
	if textProg.value >= 100:
		textProg.value = 0



