extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Use `load()` instead of `preload()` if the path isn't known at compile-time.
	var scenes = []
	
	var array_invaders = [[]]
	var row = 0
	var col = 0
	var count = 0
	var total_sm = 11
	var total_md = 22
	var total_lg = 22
	var starting = Vector2(20,20)
	var total = 0
	for t in total_sm:
		scenes.append(preload("res://SmallInvader.tscn").instance())
	for t in total_md:
		scenes.append(preload("res://MediumInvader.tscn").instance())
	for t in total_lg:
		scenes.append(preload("res://LargeInvader.tscn").instance())
	for h in range(0,5):
		for i in range(0,11):
	
				total = (h * 11) + i
				scenes[total].count = count + 1
				scenes[total].position = starting
				scenes[total].row = row
				scenes[total].col = col
				add_child(scenes[total])
				starting.x = starting.x + 40
				col = col +1
				count = count + 1
		row = row + 1
		starting.y = starting.y + 40
		starting.x = 20
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
