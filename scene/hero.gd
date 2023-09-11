extends CharacterBody3D
class_name PlayerCharacter

@export var camera_arm : CameraArm

var target : Node3D


func _physics_process(_delta):
	pass

	
	
func auto_aim(group,reach,arc):
	var nearest
	var nearest_dot
	var direction = Vector3(sin(rotation.y), 0, cos(rotation.y))
	var arc_length = cos(deg_to_rad(arc))
	
	
	for i in get_tree().get_nodes_in_group(group):
		var i_disp = i.position - position
		var i_dist = i_disp.length()
		var i_dir = i_disp.normalized()
		var i_dot = i_dir.dot(direction)
		
		if not nearest or i_dot > nearest_dot:
			if i_dot <= arc_length and i_dist <= reach:
				nearest = i
				nearest_dot = i_dot
				
	target = nearest
	if target:
		print("Target = ", target)
		look_at(Vector3(target.position.x,position.y,target.position.z))



func _on_area_3d_body_entered(body):
	if body is EnemyCharacter:
		body.add_to_group("targetable")
		print("Targetable: ", get_tree().get_nodes_in_group("targetable"))


func _on_area_3d_body_exited(body):
	if body.is_in_group("targetable"):
		body.remove_from_group("targetable")
