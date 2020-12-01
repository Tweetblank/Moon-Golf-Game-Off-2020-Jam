extends Area2D

export (String, FILE, "*.Tscn") var next_level
onready var GoalPlayer = preload("res://Scenes/Sounds/GoalStreamPlayer.tscn")

func _on_Goal_body_entered(body):
	var goalSound = GoalPlayer.instance()
	get_tree().current_scene.add_child(goalSound)
	
	yield(goalSound, "finished")
	
	get_tree().change_scene(next_level)

