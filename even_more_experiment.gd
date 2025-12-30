extends Node2D


var gridX: int = 1920/45#480#150#1920/4
var gridY: int = 1080/45#270#250#1080/4
var size: float = 0.002
var fakeCenter = Vector2(1920/1080*.5, 1920/1080*.5)
var center = fakeCenter*Vector2(1.0, 0.555)
var offsize: float = size*10
var offset: Vector2 = Vector2(gridX*offsize/2, gridY*offsize/2)
var points: Array# = [Vector3(fakeCenter.x, fakeCenter.y*0.555 ,0.001)]
@onready var r = $CanvasLayer/rectangle.material

func _ready() -> void:
	randomize()
	generate_stars()
	#print(points)
	r.set_shader_parameter("circles", points)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		points.clear()
		generate_stars()
		r.set_shader_parameter("circles", points)

func generate_stars():
	for i in range(gridX):
		#if i % 5 == 0: #size
			for j in range(gridY):
				#if j % 5 == 0: #size
					#var po = Vector2(i*size,j*size)-offset +Vector2(randi_range(-10, 10), randi_range(-10, 10))#Vector2(i*size,j*size)-offset + Vector2(randi_range(-1*(size*10), (size*10)), randi_range(-1*(size*10), (size*10)))
					#var starSize = 2+randi_range(-1, 1)+size/2
					#points.append(Vector3(center.x*(i*0.01-offset.x), center.y*(j*0.01-offset.y), 0.01))
					points.append(Vector3(i*offsize-offset.x+center.x+(offsize*randi_range(-2, 2)), j*offsize-offset.y+center.y+(offsize*randi_range(-2, 2)), size+randi_range(-1,1)*size/20))
