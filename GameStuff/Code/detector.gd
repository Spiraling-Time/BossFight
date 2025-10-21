extends Area2D
@onready var colli = $CollisionShape2D
@onready var colore = $ColorRect
func _ready() -> void:
	colore.size = colli.shape.size
	colore.position = colli.position - Vector2(colli.shape.size.x/2, colli.shape.size.y/2)
func _physics_process(delta: float) -> void:
	for bodies in get_overlapping_bodies():
		if bodies.modulate != Color.RED:
			bodies.visible = true
			bodies.modulate = Color.RED
			bodies.set_collision_layer_value(1, false,)
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 10
	elif Input.is_key_pressed(KEY_RIGHT):
		position.x += 10
	if Input.is_key_pressed(KEY_UP):
		position.y -= 10
	elif Input.is_key_pressed(KEY_DOWN):
		position.y += 10
