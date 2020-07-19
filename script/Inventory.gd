extends CanvasLayer

var open = false setget set_open

onready var parent = get_parent()

var active_conduit = null
var active_projectile = null
var active_effect = null

onready var Anim = $AnimationPlayer

###
onready var Conduits = $Conduits
onready var Conduit1 = $Inventory/Conduits/Conduit1
onready var Conduit2 = $Inventory/Conduits/Conduit2
onready var Conduit3 = $Inventory/Conduits/Conduit3
onready var Conduit4 = $Inventory/Conduits/Conduit4

onready var Projectiles = $Inventory/Projectiles
onready var Projectile1 = $Inventory/Projectiles/Projectile1
onready var Projectile2 = $Inventory/Projectiles/Projectile2
onready var Projectile3 = $Inventory/Projectiles/Projectile3
onready var Projectile4 = $Inventory/Projectiles/Projectile4

onready var Effects = $Inventory/Effects
onready var Effect1 = $Inventory/Effects/Effect1
onready var Effect2 = $Inventory/Effects/Effect2
onready var Effect3 = $Inventory/Effects/Effect3
onready var Effect4 = $Inventory/Effects/Effect4
###

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		set_open(!open)

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
		active_conduit = Globals.Magic[Globals.Conduit1]
		parent.WandManager.set_current_conduit(active_conduit)

func _on_Conduit2_toggled():
	if Conduit2.is_visible() and active_conduit != Globals.Magic[Globals.Conduit2]:
		active_conduit = Globals.Magic[Globals.Conduit2]
		parent.WandManager.set_current_conduit(active_conduit)

func _on_Conduit3_toggled():
	if Conduit3.is_visible() and active_conduit != Globals.Magic[Globals.Conduit3]:
		active_conduit = Globals.Magic[Globals.Conduit3]
		parent.WandManager.set_current_conduit(active_conduit)

func _on_Conduit4_toggled():
	if Conduit4.is_visible() and active_conduit != Globals.Magic[Globals.Conduit4]:
		active_conduit = Globals.Magic[Globals.Conduit4]
		parent.WandManager.set_current_conduit(active_conduit)
