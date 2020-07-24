extends KinematicBody2D

var velocity = Vector2.ZERO
var line0 = ""
var line1 = "Congratulations on making it to the end!"
var line2 = "You have proven yourself to be adept with magic."
var line3 = "However, there is one last task you must complete..."
var line4 = "You must put all of your knowledge to the test"
var line5 = "LET THE BATTLE BEGIN"
var lines = [line0, line1, line2, line3, line4, line5]

var line_number = 0
var current_line

signal dialogue_finished

func _process(delta):
	var p = Player.position
	if p.x > position.x:
		$Sprite.flip_h = false
	if p.x < position.x:
		$Sprite.flip_h = true
	current_line = lines[line_number]
	$Label.text = current_line

func _physics_process(delta):
	velocity.y += 20
	velocity = move_and_slide(velocity)

func next_line():
	print(Player.position)
	if line_number != 5:
		if line_number == 4 or line_number == 5:
			$Typewriter.play("FastTypewriter")
		else:
			$Typewriter.play("Typewriter")
		line_number = clamp(line_number + 1, 0, 5)
	else:
		$Timer.stop()
		emit_signal("dialogue_finished")
		start_battle()

func _on_Timer_timeout():
	next_line()

func _on_Delay_timeout():
	next_line()
	$Timer.start()

func _on_CanvasLayer_finished():
	$Delay.start()

func start_battle():
	$Typewriter.play("Exit")
	yield($Typewriter, "animation_finished")
	set_physics_process(false)
	position = Vector2(0, 86)
	$AnimationPlayer.stop()
	$Sprite.frame = 11
	$Label.visible = false
	$Typewriter.play("Enter")
	emit_signal("dialogue_finished")

