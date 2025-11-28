extends Node2D
var gridX: int = 1920
var gridY: int = 1080
var size: int = 5
var offset: Vector2 = Vector2(gridX*size/2, gridY*size/2)
var points: Array = []
@onready var timer = $Timer
@onready var poly1 = $Polygon2D2
@onready var poly2 = $Polygon2D
func _ready() -> void:
	randomize()
	generate_stars()

					
func _draw() -> void:
	for i in range(points.size()):
		draw_circle(points[i][0], points[i][1], points[i][2])

func generate_stars():
	for i in range(gridX):
		if i % size == 0:
			for j in range(gridY):
				if j % size == 0:
					var po = Vector2(i*size,j*size)-offset +Vector2(randi_range(-10, 10), randi_range(-10, 10))#Vector2(i*size,j*size)-offset + Vector2(randi_range(-1*(size*10), (size*10)), randi_range(-1*(size*10), (size*10)))
					var starSize = randi_range(-1, 1)+size/2
					if Geometry2D.is_point_in_polygon(po, poly1.polygon):
						points.append([po, starSize, Color(randi_range(5,10)/10.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0, 1.0)])
					elif Geometry2D.is_point_in_polygon(po, poly2.polygon):
						points.append([po, starSize, Color.BLUE])
	timer.start()

func _process(delta: float) -> void:
	#for i in range(4, 0, -1):
		##await  get_tree().process_frame
		#for j in range(points.size()):
			#points[j][1]  += 0.2
			#print(points[j][1])
			#queue_redraw()
	#for i in range(4, 0, -1):
		##await  get_tree().process_frame
		#for j in range(points.size()):
			#points[j][1]  -= 0.2
			#queue_redraw()
	pass

func _on_timer_timeout() -> void:
	for j in range(points.size()):
		points[j][1] += randi_range(-10,10)/10.0
		if points[j][1] < 0.1: points[j][1] = 0.1
		elif points[j][1] > 4.0: points[j][1] = 4.0
		queue_redraw()
	timer.start()
	
	
	#points.clear()
	#generate_stars()
	#queue_redraw()
