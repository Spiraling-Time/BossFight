extends Node2D


var gridX: int = 480#150#1920/4
var gridY: int = 270#250#1080/4
var size: int = 5
var center = Vector2(1920/1080*.5, 1920/1080*.5)
var offset: Vector2 = Vector2(gridX*size/2, gridY*size/2)
var points: Array = [Vector3(center.x, center.y*0.5 ,0.001)]
@onready var r = $CanvasLayer/rectangle.material

func _ready() -> void:
	randomize()
	#generate_stars()
	r.set_shader_parameter("circles", points)
#func _draw() -> void:
	#for i in range(points.size()):
		#draw_circle(points[i][0], points[i][1], points[i][2])

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		r.set_shader_parameter("circles", points)

func generate_stars():
	for i in range(gridX):
		#if i % 5 == 0: #size
			for j in range(gridY):
				#if j % 5 == 0: #size
					var po = Vector2(i*size,j*size)-offset +Vector2(randi_range(-10, 10), randi_range(-10, 10))#Vector2(i*size,j*size)-offset + Vector2(randi_range(-1*(size*10), (size*10)), randi_range(-1*(size*10), (size*10)))
					var starSize = randi_range(-1, 1)+size/2
					points.append([po, starSize+2, Color(0.0, randi_range(2,6)/10.0, 15.723, 1.0), true, "trident"])
