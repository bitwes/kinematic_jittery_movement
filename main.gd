
extends Node2D

var g_speed = 0
var _slider = null
var _speed_label = null
const CAR_GROUP = 'CARS'

func _ready():
	set_process(true)
	_slider = get_node("speedSlider")
	_speed_label = get_node("speedLabel")
	
	g_speed = _slider.get_val()
	_speed_label.set_text("Speed:  " + str(g_speed))
	

func _process(delta):
	#print number of cars that exist
	var count = get_tree().get_nodes_in_group(CAR_GROUP).size()
	get_node("carsLabel").set_text("Cars:  " + str(count))

#Set the speed and change speed of all spawned cars
func _on_speedSlider_value_changed( value ):
	g_speed = value
	_speed_label.set_text("Speed:  " + str(g_speed))
	for car in  get_tree().get_nodes_in_group(CAR_GROUP):
		car.speed = g_speed

#Common setup for all spawned cars
func _setup_car(new_car):
	add_child(new_car)
	new_car.speed = g_speed
	new_car.add_to_group(CAR_GROUP)
	
func _on_btnSpawnKinematic_pressed():
	var new_car = get_node("kinematic_car").duplicate()
	_setup_car(new_car)
	
func _on_btnSpawnNode_pressed():
	var new_car = get_node("node2d_car").duplicate()
	_setup_car(new_car)

func _on_btnSpawnSprite_pressed():
	var new_car = get_node("sprite_car").duplicate()
	_setup_car(new_car)
