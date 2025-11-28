extends Node2D
var gridX: int = 1920
var gridY: int = 1080
var size: int = 5
var offset: Vector2 = Vector2(gridX*size/2, gridY*size/2)
var points: Array = []
func _ready() -> void:
	randomize()
	for i in range(gridX):
		if i % size == 0:
			for j in range(gridY):
				if j % size == 0:
					var po = Vector2(i*size,j*size)-offset#Vector2(i*size,j*size)-offset + Vector2(randi_range(-1*(size*10), (size*10)), randi_range(-1*(size*10), (size*10)))
					if Geometry2D.is_point_in_polygon(po, $Polygon2D2.polygon): points.append([po, size/2, Color(randi_range(5,10)/10.0, randi_range(5,10)/10.0, randi_range(5,10)/10.0, 1.0)])
					elif Geometry2D.is_point_in_polygon(po, $Polygon2D.polygon): points.append([po, size/2, Color.BLUE])
					
func _draw() -> void:
	for i in range(0, points.size()):
		draw_circle(points[i][0], points[i][1], points[i][2], true)
