
extends Node2D

var speed = 0

func _ready():
	set_process(true)

func _process(delta):
	
	set_pos(Vector2(get_pos().x + speed * delta, get_pos().y))
	
	if(get_pos().x > 2000):	
		self.queue_free()
