extends Node2D

var gridX: int = 1920/40#480#150#1920/4
var gridY: int = 1080/54#270#250#1080/4
var size: float = 0.002
var points: Array = []# = [Vector3(fakeCenter.x, fakeCenter.y*0.555 ,0.001)]
var colors: Array = []
var points2: Array = []
var colors2: Array = []

@onready var r = $CanvasLayer/rectangle.material
@onready var r2 = $CanvasLayer2/rectangle.material


func _ready() -> void:
	randomize()
	generate_stars()
	#print(points)
	r.set_shader_parameter("circles", points)
	r.set_shader_parameter("colors", colors)
	r2.set_shader_parameter("circles", points2)
	r2.set_shader_parameter("colors", colors2)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		points.clear()
		colors.clear()
		points2.clear()
		colors2.clear()
		generate_stars()
		r.set_shader_parameter("circles", points)
		r.set_shader_parameter("colors", colors)
		r2.set_shader_parameter("circles", points2)
		r2.set_shader_parameter("colors", colors2)
	elif Input.is_action_just_pressed("down"):
		pass

#
#func generate_stars():
	#for i in range(gridX):
		##if i % 5 == 0: #size
			#for j in range(gridY):
				##if j % 5 == 0: #size
					##var po = Vector2(i*size,j*size)-offset +Vector2(randi_range(-10, 10), randi_range(-10, 10))#Vector2(i*size,j*size)-offset + Vector2(randi_range(-1*(size*10), (size*10)), randi_range(-1*(size*10), (size*10)))
					##var starSize = 2+randi_range(-1, 1)+size/2
					##points.append(Vector3(center.x*(i*0.01-offset.x), center.y*(j*0.01-offset.y), 0.01))
					#var randX: float = 0.0#randi_range(20,-20)/100.0
					#var randY: float = 0.0#randi_range(20,-20)/100.0
					#points.append(Vector3(34.177*i*size, 20.1*j*size, size))
					##points.append(Vector3(size/2+i*size*14+randX, size/2+j*size*7.8+randY, size))
					#colors.append(Vector3(randi_range(5,10)/10.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0))

#AI HELPED MAKE THIS
func generate_stars():
	var stepX := 1.0 / gridX
	var stepY := 1.0 / gridY
	for i in range(gridX):
		for j in range(gridY):
			points.append(Vector3((i + 0.5) * stepX, (j + 0.5) * stepY, size)+Vector3(stepX*randf_range(0.5,-0.5), stepY*randf_range(0.5,-0.5), 0.0))
			colors.append(Vector3(randi_range(5,10) / 10.0, randi_range(5,10) / 10.0, randi_range(5,10) / 10.0))

			points2.append(Vector3((i + 0.5) * stepX, (j + 0.5) * stepY, size)+Vector3(stepX*randf_range(0.5,-0.5), stepY*randf_range(0.5,-0.5), 0.0))
			colors2.append(Vector3(randi_range(5,10) / 10.0, randi_range(5,10) / 10.0, randi_range(5,10) / 10.0))
