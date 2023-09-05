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
		
	elif sm.input.targeting:
		sm.change_state(sm.targeting_state)
	else:
		sm.body.velocity = sm.input.move_vector * speed
		sm.body.direction = sm.input.move_vector.normalized()
		sm.body.look_at(sm.body.position + sm.body.direction)
		sm.camera_arm.tethered_follow()
		sm.body.move_and_slide()
		sm.animation_tree.set("parameters/RunBlend/blend_amount",sm.input.move_force)
		
		sm.body.target = sm.body.find_target("targetable",2,90)
		if sm.body.target:
			var turn = sm.body.head_turn(sm.body.target)
			sm.animation_tree.set("parameters/TurnBlend/add_amount",turn)
		else:
			sm.animation_tree.set("parameters/TurnBlend/add_amount",0)

		
		



func exit_state():
	sm.animation_tree.set("parameters/RunBlend/blend_amount",0)
	pass


