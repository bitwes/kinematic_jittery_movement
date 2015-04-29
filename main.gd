
extends Node2D

var g_speed = 0
const CAR_GROUP = 'CARS'

var _godot_sprite = load('icon.png')
var _car_sprite = load('mustang.png')
var _cur_sprite = _car_sprite

#objects delcared in editor
var _slider = null
var _speed_label = null
var _kinematic_car = null
var _node2d_car = null
var _sprite_car = null


func _ready():
	set_process(true)
	_slider = get_node("speedSlider")
	_speed_label = get_node("speedLabel")
	_kinematic_car = get_node("kinematic_car")
	_node2d_car = get_node("node2d_car")
	_sprite_car = get_node("sprite_car")
	
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
	#new_car.get_node("sprite").set_texture(_cur_sprite)
	_setup_car(new_car)
	
func _on_btnSpawnNode_pressed():
	var new_car = get_node("node2d_car").duplicate()
	#new_car.get_node("sprite").set_texture(_cur_sprite)
	_setup_car(new_car)

func _on_btnSpawnSprite_pressed():
	var new_car = get_node("sprite_car").duplicate()
	#new_car.set_texture(_cur_sprite)
	_setup_car(new_car)


func _on_iconChoice_button_selected( button ):
	if(button == 0):
		_cur_sprite = _car_sprite
	elif(button == 1):
		_cur_sprite = _godot_sprite

	_kinematic_car.get_node("sprite").set_texture(_cur_sprite)
	_node2d_car.get_node("sprite").set_texture(_cur_sprite)
	_sprite_car.set_texture(_cur_sprite)

func _on_btnOneOfEach_pressed():
	_on_btnSpawnKinematic_pressed()
	_on_btnSpawnNode_pressed()
	_on_btnSpawnSprite_pressed()
