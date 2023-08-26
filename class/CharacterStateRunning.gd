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
	elif sm.input.targeting:
		sm.change_state(sm.targeting_state)
	else:
		sm.body.velocity = sm.input.move_vector * speed
		sm.body.move_and_slide()
		sm.body.look_at(sm.body.position + sm.input.move_vector)
#		sm.body.facing = sm.body.velocity.normalized()
		sm.animation_tree.set("parameters/RunBlend/blend_amount",sm.input.move_force)
		sm.camera_arm.tethered_follow()



func exit_state():
	pass


