extends CharacterBody3D

@export var camera_arm : CameraArm
@export var marker_tracker : Node3D
@export var rig : Node3D


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


var target : Node3D
var next_target: Node3D








