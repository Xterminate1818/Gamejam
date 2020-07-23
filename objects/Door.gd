extends Sprite

export var unlocked: bool = true
export var next_scene: String = ""

onready var door = get_node("AnimationPlayer")

func _process(delta):
	print(next_scene)
	if $Area2D.get_overlapping_bodies().size() != 0:
		if unlocked:
			$Label.text = "F to Open"
			if Input.is_action_pressed("open"):
				Player.current_scene = next_scene
				get_tree().change_scene(next_scene)
		else:
			$Label.text = "Locked"
		$Label.visible = true
	else:
		$Label.visible = false

func lock():
	unlocked = false

func unlock():
	unlocked = true

