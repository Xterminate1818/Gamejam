extends Sprite

export var unlocked: bool = true
export var next_scene: String

onready var door = get_node("AnimationPlayer")

func _process(delta):
	if $Area2D.get_overlapping_bodies().size() != 0:
		if Input.is_action_pressed("open") and unlocked:
			Player.current_scene = next_scene
			get_tree().change_scene(next_scene)

