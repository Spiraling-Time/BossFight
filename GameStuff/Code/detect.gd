extends Area2D
@onready var world
#var points: Array = []

func _ready() -> void:
	world = get_tree().current_scene
	
func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 2
	elif Input.is_key_pressed(KEY_RIGHT):
		position.x += 2
	if Input.is_key_pressed(KEY_UP):
		position.y -= 2
	elif Input.is_key_pressed(KEY_DOWN):
		position.y += 2
	if has_overlapping_areas():
		world.add()
