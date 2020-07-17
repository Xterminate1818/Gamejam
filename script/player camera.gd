extends Camera2D

const LOOK_X_FACTOR = 0.2
const SHIFT_TRANS = Tween.TRANS_SINE
const SHIFT_EASE = Tween.EASE_OUT
const SHIFT_DURATIOIN = .5

var facing = 0
var prev_facing = facing

onready var prev_pos = get_camera_position()
onready var tween: Tween = $Tween
onready var parent = get_parent()

func _ready():
	set_limits()


func set_limits():
	var tilemap: TileMap = get_tree().get_nodes_in_group("Tilemap")[0]
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.cell_size
	limit_left = (map_limits.position.x + 1) * map_cellsize.x
	limit_right = (map_limits.end.x - 1) * map_cellsize.x - 1
	limit_top = (map_limits.position.y + 1) * map_cellsize.y
	limit_bottom = (map_limits.end.y - 1) * map_cellsize.y


func _process(delta):
	if facing != 0:
		prev_facing = facing
	check_facing()


func check_facing():
	if parent.input_direction != 0:
		facing = parent.input_direction
	var target = get_viewport_rect().size.x * parent.input_direction * LOOK_X_FACTOR
	tween.interpolate_property(self, "position:x", position.x, target, SHIFT_DURATIOIN, SHIFT_TRANS, SHIFT_EASE)
	tween.start()


func _on_grounded_updated(is_grounded):
	drag_margin_v_enabled = !is_grounded
	print(is_grounded)
