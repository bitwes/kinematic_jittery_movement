
extends Node2D

var g_car = null;
var g_speed = 50

func _ready():
	g_car = get_node("car")
	

func _on_btnSpawnCar_pressed():
	var new_car = g_car.duplicate()
	add_child(new_car)
	new_car.set_pos(Vector2(0, 400))
	new_car.speed = g_speed

func _on_speedSlider_value_changed( value ):
	g_speed = value
