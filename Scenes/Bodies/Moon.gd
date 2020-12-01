extends Area2D

export var rotation_speed = PI

func _physics_process(delta):
	$MoonBody.rotation += rotation_speed * delta

