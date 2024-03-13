extends Area2D
class_name LandingZone
var dialogue_scene
var CurentStoryScript = "prout"

signal interaction_started(StoryScript)

func _ready():
	dialogue_scene = get_tree().get_root().get_node("MapScene/DialogueScene")
	self.interaction_started.connect(dialogue_scene.start_dialogue)

func interraction_start():
	$Indicator.show()
	interaction_started.emit(choose_storylet())
#charcher dialogue_scene
	
func interraction_stop():
	$Indicator.hide()

func choose_storylet():
	return
