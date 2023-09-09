extends CharacterState
class_name CharacterStateRunning



@export var speed : int# temporary variable

func enter_state():
	print("Running")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
	
	if not sm.body.is_on_floor():
		sm.change_state(sm.falling_state)
		
	elif sm.input.move_force == 0:
		sm.change_state(sm.standing_state)
		
	elif sm.input.action:
		sm.change_state(sm.action_state)
		
	elif sm.input.aiming:
		sm.change_state(sm.aiming_state)
	else:
		sm.camera_arm.tethered_follow()
		
		sm.body.velocity = sm.input.move_vector * speed
		sm.body.look_at(sm.body.position + sm.body.velocity)
		sm.body.move_and_slide()
		
		sm.animation_tree.set_run_speed(sm.input.move_force)


		
		



func exit_state():
	sm.animation_tree.set_run_speed(0)
	pass


