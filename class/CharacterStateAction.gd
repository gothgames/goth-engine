extends CharacterState
class_name CharacterStateAction

# Called when the node enters the scene tree for the first time.
func enter_state():


	sm.body.auto_aim("targetable",2,90)
	sm.animation_tree.fire_action("character_animations/punching")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
	if not sm.animation_tree.get_action_active():
		action_end()


	

func action_activate():
	pass

	
func action_end():
	if not sm.body.is_on_floor():
		sm.change_state(sm.falling_state)
		
	elif sm.input.action:
		sm.animation_tree.fire_action("character_animations/punching")
		
	elif sm.input.aiming:
		sm.change_state(sm.aiming_state)
		
	elif sm.input.move_force:
		sm.change_state(sm.running_state)
			
	else:
		sm.change_state(sm.standing_state)

func exit_state():
	sm.animation_tree.abort_action()
