extends CharacterBody2D
var dir = Vector2.ZERO
var speed = 400
#func _physics_process(delta: float) -> void:
	#if Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right"):
		#if Input.is_action_pressed("up"): dir.y = -1
		#elif Input.is_action_pressed("down"): dir.y = 1
		#if Input.is_action_pressed("left"): dir.x = -1
		#elif Input.is_action_pressed("right"): dir.x = 1
	#else:
		#dir.x = move_toward(dir.x, 0, 0.1)
		#dir.y = move_toward(dir.y, 0, 0.1)
	#velocity = speed*dir
	#move_and_slide()
	
