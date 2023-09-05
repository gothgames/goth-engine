@icon("res://icons/state_machine_icon.png")
extends Node
class_name CharacterStateMachine

@export_category("Character Nodes")
@export var body : CharacterBody3D
@export var camera_arm : CameraArm
@export var animation_player : AnimationPlayer
@export var animation_tree : AnimationTree
@export var input : CharacterInput

@export_category("State Nodes")
@export var initial_state : CharacterState
@export var standing_state : CharacterState
@export var running_state : CharacterState
@export var targeting_state : CharacterState
@export var falling_state : CharacterState
@export var action_state : CharacterState


@onready var state : CharacterState = initial_state


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.sm = self
	state.enter_state()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	state.physics_step(delta)


func change_state(next_state):
	state.exit_state()
	state = next_state
	state.enter_state()
