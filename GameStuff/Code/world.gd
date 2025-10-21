extends Node2D
#@export var block = preload("res://GameStuff/Scenes/block.tscn")
#var gridX: int = 50
#var gridY: int = 50
#var size: int = 10
#var offset: Vector2 = Vector2(gridX*size/2, gridY*size/2)
func _ready() -> void:
	#CREATE GRID
	#for i in range(gridX):
		#for j in range(gridY):
			#var newBlock = block.instantiate()
			#newBlock.position = Vector2(i*size,j*size)-offset
			#add_child(newBlock)
	pass
