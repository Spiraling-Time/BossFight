extends Area2D
var world
#var points: Array = []
#BACKGROUND
var background
#BODY
var face
var torso
var rightleg
var leftleg
var hand
#PANTS
var pants
#BEARD
var beard
#TRIDENT
var trident
func _ready() -> void:
	world = get_tree().current_scene
func _physics_process(delta: float) -> void:
	if face.get_overlapping_areas().size() >= 1 || :
		world.points.append()

func _ready() -> void:
	world = get_tree().current_scene
	
func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 1
	elif Input.is_key_pressed(KEY_RIGHT):
		position.x += 1
	if Input.is_key_pressed(KEY_UP):
		position.y -= 1
	elif Input.is_key_pressed(KEY_DOWN):
		position.y += 1
	if has_overlapping_areas():
		var hit = get_overlapping_areas()[0]
		if hit.name == "body" || hit.name == "pants" || hit.name == "beard": world.add(global_position, Color.RED)
		elif hit.name == "trident": world.add(global_position, Color.SILVER)
		
