extends Node2D

export var rotation_speed = PI

func _physics_process(delta):
	self.rotation += rotation_speed * delta

