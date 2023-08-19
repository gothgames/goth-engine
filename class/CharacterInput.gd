extends Node
class_name CharacterInput

var joystick : Vector3
var orientation : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):

	var camera : Camera3D = get_viewport().get_camera_3d()
	
	joystick.x = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	joystick.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	
	if camera:
		orientation = Vector3(sin(camera.rotation.y),0,cos(camera.rotation.y))
		joystick = (orientation * joystick.z) + (orientation.cross(Vector3.UP) * joystick.x)
	
	if joystick.length() > 1:
		joystick = joystick.normalized()
