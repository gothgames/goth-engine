extends CharacterState
class_name CharacterStateStanding


func enter_state():
	print("Standing")
	sm.animation_tree.set("parameters/RunBlend/blend_amount",0.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
	
	
	if not sm.body.is_on_floor():
		sm.change_state(sm.falling_state)
		
	elif sm.input.action:
		sm.change_state(sm.action_state)
		
	elif sm.input.targeting:
		sm.change_state(sm.targeting_state)
	
	elif sm.input.move_force:
		sm.change_state(sm.running_state)
		
	else:
		sm.body.target = sm.body.find_target("targetable",2,90)
		if sm.body.target:
			var turn = sm.body.head_turn(sm.body.target)
			sm.animation_tree.set("parameters/TurnBlend/add_amount",turn)
		else:
			sm.animation_tree.set("parameters/TurnBlend/add_amount",0)
	


func exit_state():
	pass
