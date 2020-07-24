extends CanvasLayer

onready var Hearts: TextureProgress = $"Player UI Frame 2/Hearts"
onready var Energybar: TextureProgress = $"Player UI Frame 2/Energy"
onready var Regen: Timer = $Regen
onready var BurnoutSprite: Sprite = $"Player UI Frame 2/Energy Burnout"

var health = 3 setget set_health, get_health
var energy = 5 setget set_energy, get_energy
var is_burnout = false

func _ready():
	Player.health = Hearts.max_value
	Player.energy = Energybar.max_value

func _on_Regen_timeout():
	set_energy(get_accurate_energy() + 1)
	if get_accurate_energy() == Energybar.max_value:
		is_burnout = false

func _process(delta):
	if Player.health == null:
		Player.health = Hearts.max_value
	if Player.energy == null:
		Player.energy = Energybar.max_value
	if get_accurate_energy() < Energybar.max_value and Regen.is_stopped():
		Regen.start()
	BurnoutSprite.visible = is_burnout
	set_health(Player.health)
	set_energy(Player.energy)

func set_health(value):
	if Hearts.value > value:
		get_parent().play_hitsound()
	Player.health = clamp(value, Hearts.min_value, Hearts.max_value)
	Hearts.value = Player.health

func get_health():
	return Player.health

func set_energy(value):
	Player.energy = clamp(value, Energybar.min_value, Energybar.max_value)
	Energybar.value = Player.energy
	if Player.energy == 0:
		is_burnout = true

func get_energy():
	if is_burnout == true:
		return 0
	return Player.energy

func get_accurate_energy():
	return Player.energy

func interrupt_regen():
	Regen.start()
