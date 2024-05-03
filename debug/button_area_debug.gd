@tool
extends Button

const characters_enum = MetricsDatabase.characters
var character : characters_enum
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func enum_to_hint_string(an_enum: Dictionary) -> String:
	return ",".join(an_enum.keys().map(
		func (key: String) -> String:
			return "%s:%d" % [key, an_enum[key]]
	))

func _get_property_list() -> Array[Dictionary]:
	var ret: Array[Dictionary] = []
	
	ret.append({
		name = "character",
		type = TYPE_INT,
		hint = PROPERTY_HINT_ENUM,
		hint_string = enum_to_hint_string(characters_enum),
		usage = PROPERTY_USAGE_DEFAULT
	})
	notify_property_list_changed()
	return ret


func _on_pressed():
	var sequence = SequencesManager.choose_sequence_to_play(character)
	$"..".read_dialogue(sequence, character)
