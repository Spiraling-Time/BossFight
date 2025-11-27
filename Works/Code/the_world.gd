extends Node2D
var gridX: int = 1920
var gridY: int = 1080
var size: int = 5
var offset: Vector2 = Vector2(gridX*size/2, gridY*size/2)
var points: Array = []
var e: bool = false
func _ready() -> void:
	for i in range(gridX):
		if i % size == 0:
			for j in range(gridY):
				if j % size == 0:
					var po = Vector2(i*size,j*size)-offset#Vector2(i*size,j*size)-offset + Vector2(randi_range(-1*(size*10), (size*10)), randi_range(-1*(size*10), (size*10)))
					if Geometry2D.is_point_in_polygon(po, $Polygon2D.polygon): e = true
					else: e = false
					if e: points.append(po)
func _draw() -> void:
	for i in range(0, points.size()):
		draw_circle(points[i], size/2, Color.BLACK, true)
