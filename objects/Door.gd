extends Sprite

export var unlocked: bool = true
export var next_scene: String
export var text: String

onready var door = get_node("AnimationPlayer")

func _ready():
	$CanvasLayer/Label.text = text

func _process(delta):
	if $Area2D.get_overlapping_bodies().size() != 0:
		if unlocked:
			$Label.text = "F to Open"
			if Input.is_action_just_pressed("open"):
				$CanvasLayer/AnimationPlayer.play("fadeout")
		else:
			$Label.text = "Locked"
		$Label.visible = true
	else:
		$Label.visible = false

func lock():
	unlocked = false

func unlock():
	unlocked = true



func _on_x_timeout():
	Player.current_scene = next_scene
	get_tree().change_scene(""+next_scene+"")
