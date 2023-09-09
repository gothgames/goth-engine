extends AnimationTree
class_name CharacterAnimationTree
	
	
func set_run_speed(speed : float):
	set("parameters/RunBlend/blend_amount",speed)
	
	
func fire_action(animation):
	#TBD: set animation to be fired before firing the oneshot
	set("parameters/ActionShot/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
func get_action_active():
	return get("parameters/ActionShot/active")
	
func abort_action():
	set("parameters/ActionShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
	
#func update_head_turn(body_direction : Vector3, head_direction : Vector3):
#	var head_turn
#	head_direction = head_direction.cross(Vector3.UP)
#	head_turn = -body_direction.dot(head_direction)
