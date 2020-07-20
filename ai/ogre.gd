extends Enemy

var contact_damage = 0.5

onready var Spr = $Sprite
onready var DamageCD = $DamageCD
onready var Hurtbox = $Area2D

func _ready():
	speed = 50

func _physics_process(delta):
	var player = Globals.player
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
