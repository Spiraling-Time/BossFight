extends Node2D
var entered: bool = false
var entered_from
var ready_to_exit: bool = false
var ogMon
var mon
var Side1
var Side2
var Side3
var Side4
var Side5
var Side6
var Side7
var Side8
var Side9
var Side10
var Side11
var Side12
var Side13
var Side14
var Side15
var Side16
var Side17
var Side18
var Side19
var Side20
var Inside
var AllSides: Array = []
func _ready() -> void:
	await get_tree().process_frame
	if $Maps/Sides/Side1:
		Side1 = $Maps/Sides/Side1
		AllSides.append(Side1)
	if $Maps/Sides/Side2:
		Side2 = $Maps/Sides/Side2
		AllSides.append(Side2)
	if $Maps/Sides/Side3:
		Side3 = $Maps/Sides/Side3
		AllSides.append(Side3)
	if $Maps/Sides/Side4:
		Side4 = $Maps/Sides/Side4
		AllSides.append(Side4)
	if $Maps/Sides/Side5:
		Side5 = $Maps/Sides/Side5
		AllSides.append(Side5)
	if $Maps/Sides/Side6:
		Side6 = $Maps/Sides/Side6
		AllSides.append(Side6)
	if $Maps/Sides/Side7:
		Side7 = $Maps/Sides/Side7
		AllSides.append(Side7)
	if $Maps/Sides/Side8:
		Side8 = $Maps/Sides/Side8
		AllSides.append(Side8)
	if $Maps/Sides/Side9:
		Side9 = $Maps/Sides/Side9
		AllSides.append(Side9)
	if $Maps/Sides/Side10:
		Side10 = $Maps/Sides/Side10
		AllSides.append(Side10)
	if $Maps/Sides/Side11:
		Side11 = $Maps/Sides/Side11
		AllSides.append(Side11)
	if $Maps/Sides/Side12:
		Side12 = $Maps/Sides/Side12
		AllSides.append(Side12)
	if $Maps/Sides/Side13:
		Side13 = $Maps/Sides/Side13
		AllSides.append(Side13)
	if $Maps/Sides/Side14:
		Side14 = $Maps/Sides/Side14
		AllSides.append(Side14)
	if $Maps/Sides/Side15:
		Side15 = $Maps/Sides/Side15
		AllSides.append(Side15)
	if $Maps/Sides/Side16:
		Side16 = $Maps/Sides/Side16
		AllSides.append(Side16)
	if $Maps/Sides/Side17:
		Side17 = $Maps/Sides/Side17
		AllSides.append(Side17)
	if $Maps/Sides/Side18:
		Side18 = $Maps/Sides/Side18
		AllSides.append(Side18)
	if $Maps/Sides/Side19:
		Side19 = $Maps/Sides/Side19
		AllSides.append(Side19)
	if $Maps/Sides/Side20:
		Side20 = $Maps/Sides/Side20
		AllSides.append(Side20)
	if $Maps/Sides/MainBody: Inside = $Maps/Sides/MainBody
	ogMon = $Maps
	mon = ogMon.duplicate()
	
func _physics_process(delta: float) -> void:
	if !entered:
		for i in range(AllSides.size()):
			if AllSides[i].get_overlapping_areas().size() >= 1:
				entered = true
				entered_from = "Side%d" % (i + 1)
				print(AllSides[i].get_overlapping_areas())
				break
	if entered:
		if !ready_to_exit:
			if Inside.get_overlapping_areas().size() >= 1:
				var stay:bool = false
				for i in range(AllSides.size()):
					if AllSides[i].get_overlapping_areas().size() >= 1: 
						stay = true
						break
				if !stay:
					ready_to_exit = true
					print("left")
		
	if ready_to_exit:
		for i in range(AllSides.size()):
			if entered_from != "Side%d" % (i + 1):
				if AllSides[i].get_overlapping_areas().size() >= 1:
					entered = false
					ready_to_exit = false
					print("sliced!")
					break
			else:
				entered = false#haven't tested this and line below
				ready_to_exit = false
				#pass
func wounds_timeout():
	#ogMon.queue_free()
	#var newMon = mon.duplicate()
	#add_child(newMon)
	#ogMon = newMon
	pass
	
