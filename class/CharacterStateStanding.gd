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
		
	elif sm.input.targeting:
		sm.change_state(sm.targeting_state)
	
	elif sm.input.move_force:
		sm.change_state(sm.running_state)
	


func exit_state():
	pass
