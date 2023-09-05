extends CharacterState
class_name CharacterStateTargeting


@export var speed : int# temporary variable

func enter_state():
	print("Targeting")
	sm.animation_tree.set("parameters/RunBlend/blend_amount",1.0)


	
##Crashes when backing away from marker
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
		if sm.body.target:
			sm.body.look_at(Vector3(sm.body.target.position.x,sm.body.position.y,sm.body.target.position.z))
		sm.body.velocity = sm.input.move_vector * speed
		sm.body.move_and_slide()
		sm.camera_arm.targeted_follow()
		sm.animation_tree.set("parameters/RunBlend/blend_amount",sm.input.move_force)
		sm.animation_tree.set("parameters/TurnBlend/add_amount",sm.input.input_vector.x)




func exit_state():
	sm.animation_tree.set("parameters/TurnBlend/add_amount",0)
	pass
