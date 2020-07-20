extends Enemy

var contact_damage = 1.5

onready var Spr = $Sprite
onready var DamageCD = $DamageCD

func _ready():
	speed = 100

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
		velocity.y = 10

	var collision = move_and_collide(velocity)
	if collision != null:
		on_impact(collision)

func on_impact(collision):
	if collision.collider.has_method("get_type") && collision.collider.get_type() == "player":
		if DamageCD.is_stopped():
			var c = collision.collider
			c.set_health(c.get_health() - contact_damage)
			DamageCD.start()

