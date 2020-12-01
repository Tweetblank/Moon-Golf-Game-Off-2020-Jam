extends "res://Scenes/Levels/Level.gd"

func _physics_process(delta):
	if $AnimationPlayer.current_animation == "Pan":
		move = true

func _on_AnimationPlayer_animation_finished(anim_name):
	move = false
	print("Finished")

