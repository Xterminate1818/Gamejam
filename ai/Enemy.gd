extends KinematicBody2D

class_name Enemy

var speed = 60
var gravity = 500
var health = 5
const UP = Vector2(0, -1)

var velocity = Vector2()

func get_type():
	return "enemy"

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier


	if is_on_wall() and is_on_floor():
		velocity.y = -150
