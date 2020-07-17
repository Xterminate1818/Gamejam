extends Node

class_name StateMachine

var state = null setget set_state
var prev_state = null

var states = {}

onready var parent = get_parent()

func _physics_process(delta):
	if state != null:
		state_logic(delta)
		var new = get_next_state(delta)
		if new != null:
			set_state(new)
		
func state_logic(delta):
	pass

func get_next_state(delta):
	return null

func enter_state(new_state, old_state):
	pass

func exit_state(old_state, new_state):
	pass

func set_state(new_state):
	prev_state = state
	state = new_state
	
	if prev_state != null:
		exit_state(prev_state, new_state)
	if new_state != null:
		enter_state(new_state, prev_state)

func add_state(state_name):
	states[state_name] = states.size()


