extends Area2D

signal oob

func _on_Boundaries_body_exited(body):
	if body.name == "Ball":
		emit_signal("oob")

