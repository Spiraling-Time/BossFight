extends Node2D
##@export var block = preload("res://GameStuff/Scenes/block.tscn")
##var gridX: int = 50
##var gridY: int = 50
##var size: int = 10
##var offset: Vector2 = Vector2(gridX*size/2, gridY*size/2)
#func _ready() -> void:
	##CREATE GRID
	##for i in range(gridX):
		##for j in range(gridY):
			##var newBlock = block.instantiate()
			##newBlock.position = Vector2(i*size,j*size)-offset
			##add_child(newBlock)
	#pass
#BELOW TES T
var points: Array = []
@onready var p = $detect
func _draw() -> void:
	for i in range(points.size()):
		draw_circle(points[i], 2.0, Color.RED, true)

func add():
	if !points.has(p.global_position):
		points.append(p.global_position)
		queue_redraw()
