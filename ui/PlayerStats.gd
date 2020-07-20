extends CanvasLayer

onready var Hearts: TextureProgress = $"Player UI Frame 2/Hearts"
onready var Energybar: TextureProgress = $"Player UI Frame 2/Energy"
onready var Regen: Timer = $Regen
onready var BurnoutSprite: Sprite = $"Player UI Frame 2/Energy Burnout"

var health = 3 setget set_health, get_health
var energy = 5 setget set_energy, get_energy
var is_burnout = false

func _on_Regen_timeout():
	set_energy(get_accurate_energy() + 1)
	if get_accurate_energy() == Energybar.max_value:
		is_burnout = false

func _process(delta):
	if get_accurate_energy() < Energybar.max_value and Regen.is_stopped():
		Regen.start()
	BurnoutSprite.visible = is_burnout

func set_health(value):
	Hearts.value = clamp(value, Hearts.min_value, Hearts.max_value)

func get_health():
	return Hearts.value

func set_energy(value):
	Energybar.value = clamp(value, Energybar.min_value, Energybar.max_value)
	if Energybar.value == 0:
		is_burnout = true

func get_energy():
	if is_burnout == true:
		return 0
	return Energybar.value

func get_accurate_energy():
	return Energybar.value

func interrupt_regen():
	Regen.start()
