extends PathFollow2D

export (int) var offset_amount = 2

func _physics_process(delta):
	self.offset += offset_amount
