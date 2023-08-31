extends CharacterBody3D
class_name PlayerCharacter

@export var camera_arm : CameraArm
@export var marker_tracker : Node3D
@export var rig : Node3D

var direction : Vector3

var target : Node3D
var next_target: Node3D

