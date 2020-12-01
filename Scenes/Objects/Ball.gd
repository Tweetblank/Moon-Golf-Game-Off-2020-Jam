extends RigidBody2D

signal still
signal motion

var velocity = Vector2.ZERO

export var speed = 3.5

func shoot(value):
	velocity = Vector2.ZERO
	$VectorSprite.hide()
	if value > 0:
		velocity += transform.x * value * speed
		apply_impulse(Vector2.ZERO, velocity)


func _physics_process(delta):
	look_at(get_global_mouse_position())

func show_sprite():
	$VectorSprite.show()


func _on_Ball_body_entered(body):
	if body.name == "MoonBody":
		emit_signal("still")
		show_sprite()
		
		
