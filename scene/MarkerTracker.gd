extends Node3D
class_name MarkerTracker

@export var character : CharacterBody3D
var marker_scene = preload("res://scene/marker.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func find_nearest():
	var nearest
	var nearest_dist
	for i in get_children():
		var i_dist = (i.position - character.position).length()
		if not nearest or i_dist < nearest_dist:
			nearest = i
			nearest_dist = i_dist
	if nearest:
		character.next_target = nearest


func _on_area_3d_body_entered(body):
	if body is Cube:
		var marker = marker_scene.instantiate()
		marker.home = self
		marker.target = body
		body.marker = marker
		add_child(marker)



func _on_area_3d_body_exited(body):
	if body is Cube:
		body.marker.queue_free()
