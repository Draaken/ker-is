@tool
extends Area2D
class_name LandingZone
var DialogueScene
const characters_enum = MetricsDatabase.characters
var character : characters_enum

signal interaction_started(Sequence)

func _ready():
	DialogueScene = get_node("/root/Main/UI/DialogueScene")
	self.interaction_started.connect(DialogueScene.SetUp)

func interraction_start():
	var sequence = SequencesManager.choose_sequence_to_play(character)
	interaction_started.emit(sequence, character)
	
func interraction_stop():
	pass 
#not used for now, dialogue_scene hide itself and doesn't inform the interraction_area



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
