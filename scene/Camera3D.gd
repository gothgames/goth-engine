extends Camera3D


@export var arm_length:float = 2
@export var elevation:float = 2
@export var target:Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = lerp(position, target.camera_arm.position, 0.2)
	look_at(target.position + Vector3.UP, Vector3.UP)
		
	
