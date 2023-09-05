extends CharacterState
class_name CharacterStateAction

# Called when the node enters the scene tree for the first time.
func enter_state():
	sm.animation_tree.set("parameters/TurnBlend/add_amount",0)
	sm.body.target = sm.body.find_target("targetable",2,90)
	if sm.body.target:
		sm.body.look_at(Vector3(sm.body.target.position.x,sm.body.position.y,sm.body.target.position.z))
		
	sm.animation_tree.set("parameters/ActionShot/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
	if not sm.animation_tree.get("parameters/ActionShot/active"):
		action_end()


	

func action_activate():
	pass

	
func action_end():
	if not sm.body.is_on_floor():
		sm.change_state(sm.falling_state)
		
	elif sm.input.action:
		sm.change_state(sm.action_state)
		
	elif sm.input.move_force:
		sm.change_state(sm.running_state)
			
	else:
		sm.change_state(sm.standing_state)

func exit_state():
	sm.animation_tree.set("parameters/ActionShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
