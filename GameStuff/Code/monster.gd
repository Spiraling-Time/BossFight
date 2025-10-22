extends Node2D
@onready var limb1 = $THEGDBODYTHING
func _on_check_wounds_timeout() -> void:
	limb1.wounds_timeout()
