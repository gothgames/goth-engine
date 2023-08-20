extends CharacterState

@export var standing_state : CharacterState
@export var falling_state : CharacterState

@export var speed : int# temporary variable

func enter_state():
	print("Running")
	sm.animation_tree.set("parameters/RunBlend/blend_amount",1.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(delta):
	if not sm.body.is_on_floor():
		sm.change_state(falling_state)
	elif sm.input.move_force == 0:
		sm.change_state(standing_state)
	else:
		sm.body.velocity = sm.input.move_vector * speed
		sm.body.move_and_slide()
		sm.body.look_at(sm.body.position + sm.body.velocity)
	pass


func exit_state():
	pass


