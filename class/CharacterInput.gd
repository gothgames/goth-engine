@icon("res://icons/character_input_icon.png")
extends Node
class_name CharacterInput

var move_vector : Vector3
var move_force : float
var target : CharacterBody3D

var targeting : bool
var action1 : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var camera : Camera3D = get_viewport().get_camera_3d()
	var orientation : Vector3
	
	move_vector.x = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	move_vector.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	
	move_force = move_vector.length()
	if move_force > 1.0:
		move_vector = move_vector.normalized()
		move_force = 1.0
	
	if camera:
		orientation = Vector3(sin(camera.rotation.y),0,cos(camera.rotation.y))
		move_vector = (orientation * move_vector.z) + (orientation.cross(Vector3.UP) * move_vector.x)
		
	if Input.is_action_pressed("targeting"):
		targeting = true
	else:
		targeting = false
	
	if Input.is_action_pressed("action1"):
		action1 = true
	else:
		action1 = false
		

