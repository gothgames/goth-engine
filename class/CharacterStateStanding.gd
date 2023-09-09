extends CharacterState
class_name CharacterStateStanding


func enter_state():
	print("Standing")
	sm.animation_tree.set_run_speed(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
		
	if not sm.body.is_on_floor():
		sm.change_state(sm.falling_state)
		
	elif sm.input.action:
		sm.change_state(sm.action_state)
		
	elif sm.input.aiming:
		sm.change_state(sm.aiming_state)
	
	elif sm.input.move_force:
		sm.change_state(sm.running_state)

	


func exit_state():
	pass
