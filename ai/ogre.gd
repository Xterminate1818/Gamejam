extends Enemy

var contact_damage = 0.5

onready var Spr = $Sprite
onready var DamageCD = $DamageCD
onready var Hurtbox = $Area2D

func _ready():
	speed = 50
	health = 3.5

func _physics_process(delta):
	Player.current_scene = "res://levels/World.tscn"
	if knockback != Vector2.ZERO:
		knockback = lerp(knockback, Vector2.ZERO, 0.5)
		move_and_slide(-knockback * knockback_amount)
		if knockback.x < 1 and -1 < knockback.x and knockback.y < 1 and -1 < knockback.y:
			knockback = Vector2.ZERO
		return
	var player = Player.position
	var distance = global_position.distance_to(player)
	if distance <= 400:
		if player.x > global_position.x:
			Spr.flip_h = false
			velocity.x = speed
		elif player.x < global_position.x:
			Spr.flip_h = true
			velocity.x = -speed
	if health <= 0:
		queue_free()
	if not is_on_floor():
		velocity.y = 50
	velocity = move_and_slide(velocity)
	deal_damage()

func deal_damage():
	if DamageCD.is_stopped():
		for body in Hurtbox.get_overlapping_bodies():
			if body.has_method("get_type") && body.get_type() == "player":
				body.health -= contact_damage
				DamageCD.start()

func do_knockback(normal):
	if Spr.flip_h == true:
		knockback = Vector2(-4, -4)
	else:
		knockback = Vector2(4, 0)
