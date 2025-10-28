extends Node2D
@onready var limb1 = $THEGDBODYTHING
func _ready() -> void:
	pass
func _on_check_wounds_timeout() -> void:
	limb1.wounds_timeout()
	$NavigationAgent2D.target_position = Vector2(0,-500)
	print($NavigationAgent2D.get_next_path_position())
func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_Z): _on_check_wounds_timeout()
