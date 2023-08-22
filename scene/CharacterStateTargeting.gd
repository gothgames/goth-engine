extends CharacterState



@export var speed : int# temporary variable

func enter_state():
	print("Targeting")
	sm.animation_tree.set("parameters/RunBlend/blend_amount",1.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
	if not sm.body.is_on_floor():
		sm.change_state(sm.falling_state)
		
	elif not sm.input.targeting:
		if sm.input.move_force:
			sm.change_state(sm.running_state)
		else:
			sm.change_state(sm.standing_state)
	else:
		sm.body.velocity = sm.input.move_vector * speed
		sm.body.move_and_slide()
		sm.camera_arm.locked_follow()




func exit_state():
	pass
