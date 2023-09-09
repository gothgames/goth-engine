extends CharacterState
class_name CharacterStateAiming


const ROT_SPEED = 2.5

func enter_state():
	print("Aiming")



	
##Crashes when backing away from marker
# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(delta):
	if not sm.body.is_on_floor():
		sm.change_state(sm.falling_state)
		
	elif not sm.input.aiming:
		if sm.input.move_force:
			sm.change_state(sm.running_state)
		else:
			sm.change_state(sm.standing_state)
	
	else:
		
		sm.body.rotate(Vector3.UP,delta * sm.input.input_vector.x * ROT_SPEED)
		sm.camera_arm.aiming()
		






func exit_state():
	pass
