extends Area2D

func _physics_process(delta: float) -> void:
	for bodies in get_overlapping_bodies():
		bodies.queue_free()
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 10
	elif Input.is_key_pressed(KEY_RIGHT):
		position.x += 10
