extends CharacterState

@export var standing_state : CharacterState
@export var running_state : CharacterState

func enter_state():
	print("Falling")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(delta):
	if sm.body.is_on_floor():
		if sm.input.move_force > 0:
			sm.change_state(running_state)
		else:
			sm.change_state(standing_state)
	else:
		sm.body.velocity.y -= Global.gravity * delta
		sm.body.move_and_slide()



func exit_state():
	pass
