extends CharacterBody2D
var dir = Vector2.ZERO
var speed = 400
@onready var area = $Area2D
#BACKGROUND
@onready var poly1 = $"../Polygon2D"
#BODY
@onready var poly2 = $"../Monster/body/face"
@onready var poly3 = $"../Monster/body/torso"
@onready var poly4 = $"../Monster/body/rightleg"
@onready var poly5 = $"../Monster/body/leftleg"
@onready var poly6 = $"../Monster/body/hand"
#PANTS
@onready var poly7 = $"../Monster/pants/CollisionPolygon2D"
#BEARD
@onready var poly8 = $"../Monster/beard/beard"
#TRIDENT
@onready var poly9 = $"../Monster/trident/trident"
var world
func _ready() -> void:
	world = get_tree().current_scene
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
	#if Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right"):
		#if Input.is_action_pressed("up") && Input.is_action_pressed("left"):
			#dir = Vector2(-1,-1)
		#elif Input.is_action_pressed("up") && Input.is_action_pressed("right"):
			#dir = Vector2(1,-1)
		#elif Input.is_action_pressed("down") && Input.is_action_pressed("left"):
			#dir = Vector2(-1,1)
		#elif Input.is_action_pressed("down") && Input.is_action_pressed("right"):
			#dir = Vector2(1,1)
		#elif Input.is_action_pressed("up"):
			#dir = Vector2.UP
		#elif Input.is_action_pressed("down"):
			#dir = Vector2.DOWN
		#elif Input.is_action_pressed("left"):
			#dir = Vector2.LEFT
		#elif Input.is_action_pressed("right"):
			#dir = Vector2.RIGHT
	#else:
		#dir.x = move_toward(dir.x, 0, 0.1)
		#dir.y = move_toward(dir.y, 0, 0.1)
	#velocity = dir*speed
	#move_and_slide()
	
	if global_position && velocity != Vector2.ZERO:
		if area.get_overlapping_areas().size() >= 1:
			world.points.append([global_position, 10.0, Color(0.0, 0.0, 0.0, 1.0), true, "darkness"])
	
