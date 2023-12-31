extends Node3D
class_name CameraArm


@export var arm_length : float = 2
@export var elevation : float = 2
@export var body : CharacterBody3D

var displacement : Vector3
var target : Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	displacement = Vector3(sin(body.rotation.y), 0, cos(body.rotation.y))
	global_transform.origin = body.position + (arm_length * displacement.normalized())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

		
func aiming():
	if body.target:
		displacement = Vector3(position.x - body.target.position.x, 0, position.z - body.target.position.z)
	else:
		displacement = Vector3(sin(body.rotation.y), 0, cos(body.rotation.y))
	position = body.position + (arm_length * displacement.normalized())
	position.y = body.position.y + elevation

	pass
#
#
func tethered_follow():
	displacement = Vector3(position.x - body.position.x, 0, position.z - body.position.z)
	position += displacement.normalized() * (arm_length - displacement.length())
	position.y = body.position.y + elevation
	pass


