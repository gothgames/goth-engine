@icon("res://icons/character_input_icon.png")
extends Node
class_name CharacterInput

@export var body : CharacterBody3D
@export var camera_arm : CameraArm

var input_vector : Vector3
var move_vector : Vector3
var move_force : float

var targeting : bool
var action : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	input_vector.x = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	input_vector.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	
	move_vector = (camera_arm.displacement * input_vector.z) + (camera_arm.displacement.cross(Vector3.UP) * input_vector.x)
	
	move_force = move_vector.length()
	if move_force > 1.0:
		move_vector = move_vector.normalized()
		input_vector = input_vector.normalized()
		move_force = 1.0
		
	if Input.is_action_pressed("targeting"):
		targeting = true
	else:
		targeting = false
	
	if Input.is_action_pressed("action"):
		action = true
	else:
		action = false







