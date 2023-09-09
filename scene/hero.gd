extends CharacterBody3D
class_name PlayerCharacter

@export var camera_arm : CameraArm
#@export var rig : Node3D

var direction : Vector3

var target : Node3D
var target_dir : Vector3
var head_turn : int

func _physics_process(_delta):
	target = find_target("targetable",2,90)
	update_head_turn()


func find_target(group,range,arc):
	var nearest
	var nearest_dot
	var arc_length = cos(deg_to_rad(arc))
	
	for i in get_tree().get_nodes_in_group("targetable"):
		
		var i_disp = i.position - position
		var i_dist = i_disp.length()
		var i_dir = i_disp.normalized()
		var i_dot = i_dir.dot(direction)
		
		if not nearest or i_dot > nearest_dot:
			if i_dot > arc_length and i_dist <= range:
				nearest = i
				nearest_dot = i_dot
			
	if nearest and nearest_dot < 1:
		return nearest




func update_head_turn():
	if target:
		target_dir = (target.position - position).normalized().cross(Vector3.UP)
		head_turn = -direction.dot(target_dir)



func _on_area_3d_body_entered(body):
	if body is EnemyCharacter:
		body.add_to_group("targetable")
		print("Targetable: ", get_tree().get_nodes_in_group("targetable"))


func _on_area_3d_body_exited(body):
	if body.is_in_group("targetable"):
		body.remove_from_group("targetable")
