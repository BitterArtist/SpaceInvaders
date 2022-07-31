extends Area2D
signal hit

export var row = 0
export var col = 0
export var count = 0
export var speed = 100 
export var alive = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true # Replace with function body.
	$CollisionShape2D.set_deferred("disabled", false)
	print(count)
func _process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_MediumInvader_area_entered(area):
	print("hit medium invader")
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite.animation = "hit"
	$AnimatedSprite.playing = true
	
	
