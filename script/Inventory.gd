extends CanvasLayer

var open = false setget set_open

onready var parent = get_parent()

var active_conduit = null
var active_projectile = null
var active_effect = null

onready var Anim = $AnimationPlayer
onready var ConduitSelect = $Inventory/ConduitSelect
onready var ProjectileSelect = $Inventory/ProjectileSelect

###
onready var Conduits = $Conduits
onready var Conduit1 = $Inventory/Conduits/Conduit1
onready var Conduit2 = $Inventory/Conduits/Conduit2
onready var Conduit3 = $Inventory/Conduits/Conduit3
onready var Conduit4 = $Inventory/Conduits/Conduit4

onready var Conduit1Position = $Inventory/Conduits/Conduit1/Position2D
onready var Conduit2Position = $Inventory/Conduits/Conduit2/Position2D
onready var Conduit3Position = $Inventory/Conduits/Conduit3/Position2D
onready var Conduit4Position = $Inventory/Conduits/Conduit4/Position2D

onready var Projectiles = $Inventory/Projectiles
onready var Projectile1 = $Inventory/Projectiles/Projectile1
onready var Projectile2 = $Inventory/Projectiles/Projectile2
onready var Projectile3 = $Inventory/Projectiles/Projectile3
onready var Projectile4 = $Inventory/Projectiles/Projectile4

onready var Projectile1Position = $Inventory/Projectiles/Projectile1/Position2D
onready var Projectile2Position = $Inventory/Projectiles/Projectile2/Position2D
onready var Projectile3Position = $Inventory/Projectiles/Projectile3/Position2D
onready var Projectile4Position = $Inventory/Projectiles/Projectile4/Position2D

onready var Effects = $Inventory/Effects
onready var Effect1 = $Inventory/Effects/Effect1
onready var Effect2 = $Inventory/Effects/Effect2
onready var Effect3 = $Inventory/Effects/Effect3
onready var Effect4 = $Inventory/Effects/Effect4
###

func _ready():
	for id in Player.unlocked:
		add_item(id)
	if Player.current_wand != -1:
		active_conduit = Globals.Magic[Player.current_wand]
		yield(get_tree(), "idle_frame")
		parent.WandPosition.set_current_conduit(active_conduit)
		match Player.current_wand:
			Globals.Conduit1:
				ConduitSelect.global_position = Conduit1Position.global_position
			Globals.Conduit2:
				ConduitSelect.global_position = Conduit2Position.global_position
			Globals.Conduit3:
				ConduitSelect.global_position = Conduit3Position.global_position
			Globals.Conduit4:
				ConduitSelect.global_position = Conduit4Position.global_position

	if Player.current_spell != -1:
		active_projectile = Globals.Magic[Player.current_spell]
		match Player.current_spell:
			Globals.Projectile1:
				ProjectileSelect.global_position = Projectile1Position.global_position
			Globals.Projectile2:
				ProjectileSelect.global_position = Projectile2Position.global_position
			Globals.Projectile3:
				ProjectileSelect.global_position = Projectile3Position.global_position
			Globals.Projectile4:
				ProjectileSelect.global_position = Projectile3Position.global_position

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		set_open(!open)

	if active_conduit == null:
		ConduitSelect.visible = false
	else:
		ConduitSelect.visible = true

	if active_projectile == null:
		ProjectileSelect.visible = false
	else:
		ProjectileSelect.visible = true

func _input(event):
	if event.is_action_pressed("ui_end"):
		set_open(false)

func set_open(new):
	if open != new:
		if new == true:
			Anim.play("SlideIn")
		if new == false:
			Anim.play("SlideOut")
	open = new

func add_item(index):
	match index:
		Globals.Conduit1:
			Conduit1.visible = true
		Globals.Conduit2:
			Conduit2.visible = true
		Globals.Conduit3:
			Conduit3.visible = true
		Globals.Conduit4:
			Conduit4.visible = true
		
		Globals.Projectile1:
			Projectile1.visible = true
		Globals.Projectile2:
			Projectile2.visible = true
		Globals.Projectile3:
			Projectile3.visible = true
		Globals.Projectile4:
			Projectile4.visible = true
		
		Globals.Effect1:
			Effect1.visible = true
		Globals.Effect2:
			Effect2.visible = true
		Globals.Conduit3:
			Effect3.visible = true
		Globals.Conduit4:
			Effect4.visible = true

func _on_Conduit1_toggled():
	if Conduit1.is_visible() and active_conduit != Globals.Magic[Globals.Conduit1]:
		Player.current_wand = Globals.Conduit1
		active_conduit = Globals.Magic[Globals.Conduit1]
		parent.WandPosition.set_current_conduit(active_conduit)
		ConduitSelect.global_position = Conduit1Position.global_position

func _on_Conduit2_toggled():
	if Conduit2.is_visible() and active_conduit != Globals.Magic[Globals.Conduit2]:
		Player.current_wand = Globals.Conduit2
		active_conduit = Globals.Magic[Globals.Conduit2]
		parent.WandPosition.set_current_conduit(active_conduit)
		ConduitSelect.global_position = Conduit2Position.global_position

func _on_Conduit3_toggled():
	if Conduit3.is_visible() and active_conduit != Globals.Magic[Globals.Conduit3]:
		Player.current_wand = Globals.Conduit3
		active_conduit = Globals.Magic[Globals.Conduit3]
		parent.WandPosition.set_current_conduit(active_conduit)
		ConduitSelect.global_position = Conduit3Position.global_position

func _on_Conduit4_toggled():
	if Conduit4.is_visible() and active_conduit != Globals.Magic[Globals.Conduit4]:
		Player.current_wand = Globals.Conduit4
		active_conduit = Globals.Magic[Globals.Conduit4]
		parent.WandPosition.set_current_conduit(active_conduit)
		ConduitSelect.global_position = Conduit4Position.global_position


func _on_Projectile1_pressed():
	if Projectile1.is_visible() and active_projectile != Globals.Magic[Globals.Projectile1]:
		Player.current_spell = Globals.Projectile1
		active_projectile = Globals.Magic[Globals.Projectile1]
		ProjectileSelect.global_position = Projectile1Position.global_position


func _on_Projectile2_pressed():
	if Projectile2.is_visible() and active_projectile != Globals.Magic[Globals.Projectile2]:
		Player.current_spell = Globals.Projectile2
		active_projectile = Globals.Magic[Globals.Projectile2]
		ProjectileSelect.global_position = Projectile2Position.global_position


func _on_Projectile3_pressed():
	if Projectile3.is_visible() and active_projectile != Globals.Magic[Globals.Projectile3]:
		Player.current_spell = Globals.Projectile3
		active_projectile = Globals.Magic[Globals.Projectile3]
		ProjectileSelect.global_position = Projectile3Position.global_position


func _on_Projectile4_pressed():
	if Projectile4.is_visible() and active_projectile != Globals.Magic[Globals.Projectile4]:
		Player.current_spell = Globals.Projectile4
		active_projectile = Globals.Magic[Globals.Projectile4]
		ProjectileSelect.global_position = Projectile4Position.global_position

