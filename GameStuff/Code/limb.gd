extends Node2D
var ogMon
var mon
func _ready() -> void:
	ogMon = $Maps
	mon = ogMon.duplicate()
	
func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_Z):
		ogMon.queue_free()
		var newMon = mon.duplicate()
		add_child(newMon)
		ogMon = newMon


func wounds_timeout():
	ogMon.queue_free()
	var newMon = mon.duplicate()
	add_child(newMon)
	ogMon = newMon
