extends Node2D
var gridX: int = 480#150#1920/4
var gridY: int = 270#250#1080/4
var size: int = 5
var offset: Vector2 = Vector2(gridX*size/2, gridY*size/2)
var points: Array = []
@onready var timer = $Timer
#BACKGROUND
@onready var poly1 = $Polygon2D
#BODY
@onready var poly2 = $Monster/body/face
@onready var poly3 = $Monster/body/torso
@onready var poly4 = $Monster/body/rightleg
@onready var poly5 = $Monster/body/leftleg
@onready var poly6 = $Monster/body/hand
#PANTS
@onready var poly7 = $Monster/pants/CollisionPolygon2D
#BEARD
@onready var poly8 = $Monster/beard/beard
#TRIDENT
@onready var poly9 = $Monster/trident/trident

func _ready() -> void:
	randomize()
	generate_stars()
func _draw() -> void:
	for i in range(points.size()):
		draw_circle(points[i][0], points[i][1], points[i][2])

func in_main_part(i, j):
	if (i % 2 == 0 && i > gridX/2 -65 && i < gridX/2 +65) && (j % 2 == 0 && j > gridY/2 -100 && j < gridY/2 +100): return true
	else: return false
func generate_stars():
	for i in range(gridX):
		#if i % 5 == 0: #size
			for j in range(gridY):
				#if j % 5 == 0: #size
					var po = Vector2(i*size,j*size)-offset +Vector2(randi_range(-10, 10), randi_range(-10, 10))#Vector2(i*size,j*size)-offset + Vector2(randi_range(-1*(size*10), (size*10)), randi_range(-1*(size*10), (size*10)))
					var starSize = randi_range(-1, 1)+size/2

#TRIDENT
					if Geometry2D.is_point_in_polygon(po, poly9.polygon) && in_main_part(i,j):
						points.append([po, starSize+2, Color(0.0, randi_range(2,6)/10.0, 15.723, 1.0), true, "trident"])
#PANTS
					elif Geometry2D.is_point_in_polygon(po, poly7.polygon) && in_main_part(i,j):
						points.append([po, starSize+2, Color(0.0, randi_range(1,5)/10.0, 0.0, 1.0), true, "pants"])
#BODY-TORSO%FACE
					elif Geometry2D.is_point_in_polygon(po, poly6.polygon) && in_main_part(i,j):
						points.append([po, starSize+2, Color(0.0, 0.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0), true, "body"])
					elif Geometry2D.is_point_in_polygon(po, poly5.polygon) && in_main_part(i,j):
						points.append([po, starSize+2, Color(0.0, 0.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0), true, "body"])
					elif Geometry2D.is_point_in_polygon(po, poly4.polygon) && in_main_part(i,j):
						points.append([po, starSize+2, Color(0.0, 0.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0), true, "body"])
#BEARD&FACE
					elif Geometry2D.is_point_in_polygon(po, poly2.polygon) && in_main_part(i,j):
						points.append([po, starSize+2, Color(0.0, 0.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0), true, "body"])
					elif Geometry2D.is_point_in_polygon(po, poly8.polygon) && in_main_part(i,j):
						points.append([po, starSize+2, Color(0.357, randi_range(2,5)/10.0, 0.0, 1.0), true, "beard"])
#TORSO
					elif Geometry2D.is_point_in_polygon(po, poly3.polygon) && in_main_part(i,j): 
						points.append([po, starSize+2, Color(0.0, 0.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0), true, "body"])
#BACKGROUND
					elif Geometry2D.is_point_in_polygon(po, poly1.polygon) && i % 5 == 0 && j % 5 == 0:
						points.append([po, starSize, Color(randi_range(5,10)/10.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0, 1.0), true, "backward"])
	timer.start()


func _on_timer_timeout() -> void:
	for j in range(points.size()):
		if points[j][4] == "backward":
			if  points[j][3]:
				points[j][1] += 0.1
				if points[j][1] >= 4.0:
					points[j][1] = 4.0
					points[j][3] = false
			else:
				points[j][1] -= 0.1
				if points[j][1] <= 1.0:
					points[j][1] = 1.0
					points[j][3] = true			
			queue_redraw()
		elif points[j][4] == "body" || points[j][4] == "pants" || points[j][4] == "beard" || points[j][4] == "trident":
			if  points[j][3]:
				points[j][1] += 0.1
				if points[j][1] >= 4.0:
					points[j][1] = 4.0
					points[j][3] = false
			else:
				points[j][1] -= 0.1
				if points[j][1] <= 3.0:
					points[j][1] = 3.0
					points[j][3] = true			
			queue_redraw()
	timer.start()

#RESET
	#points.clear()
	#generate_stars()
	#queue_redraw()
