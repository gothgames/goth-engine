extends CharacterState

@export var running_state : CharacterState
@export var falling_state : CharacterState

func enter_state():
	print("Standing")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
	
	if not sm.body.is_on_floor():
		sm.change_state(falling_state)
	
	elif sm.character_input.joystick.length():
		sm.change_state(running_state)
	


func exit_state():
	pass