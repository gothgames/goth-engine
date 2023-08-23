extends Node3D
class_name CameraArm


@export var arm_length:float = 2
@export var elevation:float = 2
@export var target:Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_as_top_level(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

		
func locked_follow():
	position = target.position + (arm_length * Vector3(sin(target.rotation.y),0,cos(target.rotation.y)))
	position.y = target.position.y + elevation

	
func tethered_follow():
	var displacement = target.position - position
	displacement.y = 0
	
	position += displacement.normalized() * (displacement.length() - arm_length)
	position.y = target.position.y + elevation



