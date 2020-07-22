extends KinematicBody2D

signal grounded_updated(is_grounded)
signal health_updated(new_health)
signal energy_updated(new_energy)

var velocity = Vector2()
var input_direction: int = 0
var speed = 10 * 16
var gravity
var max_jump_velocity
var min_jump_velocity
var walljump_velocity
var max_jump_height = 2.75 * 16
var min_jump_height = 0.6 * 16
var walljump_height = 2.25 * 16
var jump_duration = 0.35
var is_grounded
var touching_wall = 0 

onready var Spr: Sprite = $Sprite
onready var Occluder: LightOccluder2D = $Sprite/LightOccluder2D
onready var Anim: AnimationPlayer = $AnimationPlayer
onready var CoyoteTimer: Timer = $CoyoteTimer
onready var ShootDelay: Timer = $ShootDelay
onready var StateMachine: Node = $PlayerStateMachine
onready var WandPosition: Node2D = $WandPosition
onready var ProjectileSpawn: Node2D = $HoldPosition/ProjectileSpawn
onready var Inventory: CanvasLayer = $Inventory
onready var Stats = $Stats

onready var HitSound: AudioStreamPlayer2D = $"Enemy Hit"

onready var health = Stats.health setget set_health, get_health
onready var energy = Stats.energy setget set_energy, get_energy

func play_hitsound():
	HitSound.play(0.0)
	$HitAnimation.play("Hit")



func get_current_conduit():
	return Inventory.active_conduit

func get_current_projectile():
	return Inventory.active_projectile

func get_type():
	return "player"

func set_health(value):
	Stats.set_health(value)
	emit_signal("health_updated", value)

func get_health():
	return Stats.get_health()

func set_energy(value):
	Stats.set_energy(value)
	emit_signal("energy_updated", value)

func get_energy():
	return Stats.get_energy()

func _ready():
	gravity = 2 * max_jump_height / pow(jump_duration, 2)
	max_jump_velocity = -sqrt(2 * gravity * max_jump_height)
	min_jump_velocity = -sqrt(2 * gravity * min_jump_height)
	walljump_velocity = -sqrt(2 * gravity * walljump_height)

func _physics_process(delta):
	Player.position = global_position - Vector2(0, 10)
	emit_signal("grounded_updated", is_on_floor())
	if get_health() <= 0:
		get_tree().change_scene("res://Title/Death Screen'.tscn")

func handle_move_input():
	input_direction = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	velocity.x = lerp(velocity.x, speed * input_direction, get_movement_weight())
	WandPosition.look_at(get_global_mouse_position())

	if input_direction > 0:
		Spr.flip_h = false
		Occluder.scale.x = 1

	if input_direction < 0:
		Spr.flip_h = true
		Occluder.scale.x = -1

func jump():
	velocity.y = max_jump_velocity
	CoyoteTimer.stop()

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier

func apply_movement():
	if velocity.x > -1 and velocity.x < 1:
		velocity.x = 0
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	if !is_on_floor() and was_on_floor and velocity.y >= 0:
		CoyoteTimer.start()
	if !was_on_floor and is_on_floor():
		emit_signal("grounded_updated", is_on_floor())
	var was_grounded = is_grounded
	is_grounded = is_on_floor()

func get_movement_weight():
	if is_on_floor():
		return 0.2
	else:
		return 0.07

func _on_Area2D_body_entered(body):
	velocity.y = -150
