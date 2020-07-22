extends Area2D

var x
var y
var w
var h

export var limit_x = false
export var limit_y = true

onready var Collision = $CollisionShape2D

func _ready():
	x = Collision.global_position.x
	y = Collision.global_position.y
	w = Collision.shape.extents.x
	h = Collision.shape.extents.y
	x -= w
	y -= h
	w *= 2
	h *= 2

func _physics_process(delta):
	for b in get_overlapping_bodies():
		if b.has_method("get_type") and b.get_type() == "player":
			b.Cam.set_custom_limits(x, y, w, h, true, true)
