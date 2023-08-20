extends CharacterState

@export var running_state : CharacterState
@export var falling_state : CharacterState

func enter_state():
	print("Standing")
	sm.animation_tree.set("parameters/RunBlend/blend_amount",0.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_step(_delta):
	
	
	if not sm.body.is_on_floor():
		sm.change_state(falling_state)
	
	elif sm.input.move_force:
		sm.change_state(running_state)
	


func exit_state():
	pass
