extends CanvasLayer

onready var Hearts: TextureProgress = $"Player UI Frame 2/Hearts"
onready var Energybar: TextureProgress = $"Player UI Frame 2/Energy"
onready var Regen: Timer = $Regen

var health = 3 setget set_health, get_health
var energy = 5 setget set_energy, get_energy

func _on_Regen_timeout():
	set_energy(get_energy() + 1)

func _process(delta):
	if get_energy() < Energybar.max_value and Regen.is_stopped():
		Regen.start()

func set_health(value):
	Hearts.value = clamp(value, Hearts.min_value, Hearts.max_value)

func get_health():
	return Hearts.value

func set_energy(value):
	Energybar.value = clamp(value, Energybar.min_value, Energybar.max_value)

func get_energy():
	return Energybar.value

func interrupt_regen():
	Regen.start()
