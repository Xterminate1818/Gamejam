extends KinematicBody2D
class_name Projectile

export var speed = 400
var velocity = Vector2.ZERO
var energy_cost = 1
var damage = 1

var damage_mod = 1
var energy_mod = 1
var bounces_left = 0

var is_bounce = false
var is_charge = false
var is_prism = false
var is_triple = false

onready var Spr: Sprite = $Sprite

func get_wand_type(wand_id):
	match wand_id:
		Globals.Conduit1:
			is_charge = true
			print("charge")
		Globals.Conduit2:
			is_triple = true
			print("triple")
			var damage_mod = 0.5
		Globals.Conduit3:
			is_bounce = true
			print("bounce")
			bounces_left = 1
		Globals.Conduit4:
			print("prism")
			is_prism = true

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		on_impact(collision)
	
func launch(wand, mod = 1):
	velocity = (Vector2(speed, 0)).rotated(rotation)
	damage_mod = mod
	scale = Vector2(1, 1)
	Spr.scale = Vector2(mod, mod)
	$Light2D.texture_scale = mod / 2
	if $Particles2D != null:
		$Particles2D.scale = Vector2(mod, mod)
	get_wand_type(wand)
	return energy_cost * energy_mod

func on_impact(collision):
	print(collision.collider)
	if collision.collider.has_method("get_type") && collision.collider.get_type() == "enemy":
		var c = collision.collider
		c.health -= damage * damage_mod
		c.play_hit()
		if $FireSound.playing:
			set_physics_process(false)
			$CollisionShape2D.disabled = true
			$Sprite.visible = false
			yield($FireSound, "finished")
		queue_free()
	elif bounces_left != 0:
		bounces_left -= 1
		look_at(position + velocity.bounce(collision.normal))
		launch(null)
	else:
		if $FireSound.playing:
			set_physics_process(false)
			$CollisionShape2D.disabled = true
			$Sprite.visible = false
			yield($FireSound, "finished")
		queue_free()
