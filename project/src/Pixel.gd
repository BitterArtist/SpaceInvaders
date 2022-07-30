extends Area2D
signal hit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.set_deferred("disabled", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pixel_area_entered(area):
	print("hit")
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)


