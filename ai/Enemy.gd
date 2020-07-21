extends KinematicBody2D

class_name Enemy

var speed = 60
var gravity = 200
var health = 1
var knockback_amount = 1000
var knockback = Vector2.ZERO
const UP = Vector2(0, -1)

var velocity = Vector2()

func get_player_position():
	return Player.position

func get_type():
	return "enemy"

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier

func do_knockback(normal):
	knockback = Vector2(4, 4)

