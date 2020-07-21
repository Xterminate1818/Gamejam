extends Node2D
class_name Beam

var max_cast = Vector2(400, 0)

onready var Beam: Sprite = $Beam
onready var Begin: Sprite = $Begin
onready var Ray: RayCast2D = $Raycast2D
onready var End: Position2D = $End

func _physics_process(delta):
	Ray.cast_to = max_cast
	if Ray.is_colliding():
		End.global_position = Ray.get_collision_point()
	else:
		End.position = max_cast
	Beam.
