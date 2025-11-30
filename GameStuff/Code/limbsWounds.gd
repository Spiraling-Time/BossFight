extends Node2D
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
var world
func _ready() -> void:
	world = get_tree().current_scene
func _physics_process(delta: float) -> void:
	if face.get_overlapping_areas().size() >= 1 || :
		world.points.append()
