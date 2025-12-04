extends CharacterBody2D
var speed = 200
var dir = Vector2.ZERO
var size = 15
var exit = Vector2.ZERO
@onready var box = $"../ShapeCast2D"
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right"):
		if Input.is_action_pressed("up"): dir.y = move_toward(dir.y, -1, 0.1)
		elif Input.is_action_pressed("down"): dir.y = move_toward(dir.y, 1, 0.1)
		if Input.is_action_pressed("left"): dir.x = move_toward(dir.x, -1, 0.1)
		elif Input.is_action_pressed("right"): dir.x = move_toward(dir.x, 1, 0.1)
	else:
		dir.x = move_toward(dir.x, 0, 0.1)
		dir.y = move_toward(dir.y, 0, 0.1)
	velocity = speed*dir
	move_and_slide()
	if box.is_colliding():
		var point = box.get_collision_point(0)
		if exit == Vector2.ZERO:
			if point.x < -size || point.x >size: 
				exit.x = -1*point.x
				exit.y = 0
			elif point.y < -size || point.y >size:
				exit.y = -1*point.y
				exit.x = 0	
		
			if point.x < -size && point.y > size:
				print("bottom left")
			elif point.x > size && point.y > size:
				print("bottom right")
			elif point.x >size && point.y < -size:
				print("top right")
			elif point.x < -size && point.y < -size:
				print("top left")
		else:
			if exit.x > 0 && point.x > exit.x:
				print("exited right")
				exit = Vector2.ZERO
			elif exit.x < 0 && point.x < exit.x:
				print("exited left")
				exit = Vector2.ZERO
			elif exit.y < 0 && point.y < exit.y:
				print("exited top")
				exit = Vector2.ZERO
			elif exit.y > 0 && point.y > exit.y:
				print("exited bottom")
				exit = Vector2.ZERO
	else:exit = Vector2.ZERO
#-20, 20 is bottom left
#-20, -20 is top left
