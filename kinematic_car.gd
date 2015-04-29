
extends KinematicBody2D

var speed = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	
	move(Vector2(speed * delta, 0))
	
	if(get_pos().x > 2000):
		self.queue_free()

