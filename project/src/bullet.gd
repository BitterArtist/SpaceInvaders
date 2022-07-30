extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 750
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite.animation = "default"

func _physics_process(delta):
	position += transform.y * speed * delta * -1

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
