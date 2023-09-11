extends AnimationTree
class_name CharacterAnimationTree


func _physics_process(_delta):
	if Input.is_action_pressed("action_2"):
		fire_reaction("character_animations/light_hit_to_head")
	
func set_run_speed(speed : float):
	set("parameters/RunBlend/blend_amount",speed)
	



func fire_action(new_animation):
	tree_root.get_node("Action").animation = new_animation
	set("parameters/ActionShot/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
func get_action_active():
	return get("parameters/ActionShot/active")
	
func abort_action():
	set("parameters/ActionShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)




func fire_reaction(new_animation):
	tree_root.get_node("Reaction").animation = new_animation
	set("parameters/ReactionShot/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	

	
#func update_head_turn(body_direction : Vector3, head_direction : Vector3):
#	var head_turn
#	head_direction = head_direction.cross(Vector3.UP)
#	head_turn = -body_direction.dot(head_direction)
