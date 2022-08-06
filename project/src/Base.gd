extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var direction = 1 # 1 to the left, -1 to the right
export var alien_line = 0 # 0 is starting line, top of screen. increment to go down
export var speed = 5 # increase as units decrease
export var alien_map = [] 
export var alien_right = 0
export var alien_left = 0
# Called when the node enters the scene tree for the first time.
var scenes = []
var screen_size # Size of the game window.

func bin2int(bin_str):
	var out = 0
	for c in bin_str:
		out = (out << 1) + int(c == "1")
	return out
 
func int2bin(value):
	var out = ""
	while (value > 0):
		out = str(value & 1) + out
		value = (value >> 1)
	return out

func logWithBase(value, base): 
				return log(value) / log(base)

func rowtoint(value):
	var joined_string = PoolStringArray(value).join("")
	var out = bin2int(joined_string)
	return out

func locate():
	var left_rows = []
	var right_rows = []
	var num = 0
	var right = 0
	var left = 0
	for i in range(0,5):
		num = rowtoint(alien_map[i])
		left = logWithBase(num,2)+1
		left_rows.append(int(left))
		right_rows.append(logWithBase(num & - num,2)+1)
	
	left = left_rows.max()
	right = right_rows.min()
	return [left, right]
	


func _ready():
	screen_size = get_viewport_rect().size
	for x in range(5):
		alien_map.append([])
		alien_map[x]=[]        
		for y in range(11):
			alien_map[x].append([])
			alien_map[x][y]=1

	
	
		

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
	
				
				scenes[total].count = count + 1
				scenes[total].position = starting
				scenes[total].row = h
				scenes[total].col = i
				add_child(scenes[total])
				starting.x = starting.x + 40

				count = count + 1
				scenes[total].alive = 1
				total = total + 1

		starting.y = starting.y + 40
		starting.x = 20
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# main game loop
	var value
	value = locate()
	var first = 11 - value[1]
	var last = 11 - value[0]
	scenes[first].modulate = Color(0, 0, 1) # blue shade
	scenes[last].modulate = Color(1, 0, 1) # blue shade
	var velocity = Vector2.ZERO # The player's movement vector.
	print(scenes[first].position.x,",",(screen_size.x -5))
	if direction == 1:
		if scenes[first].position.x >= (screen_size.x - 5):
			print("shift")
			direction = -1
	else:
		if scenes[last].position.x <= 5:
			print("shift")
			direction = 1
	
	if direction== 1:
		
		velocity.x += 1
	if direction == -1:
		
		velocity.x -= 1
	

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	for scene in range(0,55):
		
		scenes[scene].position += velocity * delta
		scenes[scene].position.x = clamp(scenes[scene].position.x, 0, screen_size.x)
