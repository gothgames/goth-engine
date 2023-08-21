extends CharacterBody3D

var facing : Vector3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	facing = Vector3(-sin(rotation.y),0,-cos(rotation.y))
	print(facing)
