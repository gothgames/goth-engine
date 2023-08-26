extends Node3D
class_name Marker

var home : Node3D
var target : Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
	position = target.position + Vector3.UP
	print("Marker created at ", target)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass

	
	
