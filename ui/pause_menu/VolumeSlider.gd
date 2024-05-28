extends HSlider
var is_modifying_volume = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var value_in_db = linear_to_db(value/100)
	MusicPlayer.change_volume(value_in_db)



func _process(delta):
	if is_modifying_volume:
		#var value_in_db = remap(value, 0, 100, -80, 0)
		var value_in_db = linear_to_db(value/100)
		MusicPlayer.change_volume(value_in_db)


func _on_drag_ended(value_changed):
	is_modifying_volume = false


func _on_drag_started():
	is_modifying_volume = true
