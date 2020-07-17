extends StateMachine


func _ready():
	add_state("idle")
	add_state("run")
	add_state("jump")
	add_state("fall")
	add_state("wallslide")
	call_deferred("set_state", states.idle)
 

func _input(event):
	if [states.idle, states.run, states.wallslide].has(state) or !parent.CoyoteTimer.is_stopped():
		if event.is_action_pressed("up"):
			parent.jump()
	if state == states.jump:
		if event.is_action_released("up") and parent.velocity.y < parent.min_jump_velocity:
			parent.velocity.y = parent.min_jump_velocity


func state_logic(delta):
	parent.handle_move_input()
	parent.apply_gravity(delta)
	parent.apply_movement()


func get_next_state(delta):
	match state:
		states.idle:
			if !parent.is_on_floor():
				if parent.velocity.y < 0:
					return states.jump
				elif parent.velocity.y > 0:
					return states.fall
			elif parent.velocity.x != 0:
				return states.run
		states.run:
			if !parent.is_on_floor():
				if parent.velocity.y < 0:
					return states.jump
				elif parent.velocity.y > 0:
					return states.fall
			elif parent.velocity.x == 0:
				return states.idle
		states.jump:
			if parent.is_on_floor():
				return states.idle
			elif parent.velocity.y > 0:
				return states.fall
		states.fall:
			if parent.velocity.y < 0:
				return states.jump
			elif parent.is_on_floor():
				return states.idle
	return null


func enter_state(new_state, old_state):
	match new_state:
		states.idle:
			parent.Anim.play("Idle")
		states.run:
			parent.Anim.play("Running")
		states.jump:
			parent.Anim.play("Jumping")


func exit_state(old_state, new_state):
	pass