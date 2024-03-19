extends Area2D
class_name LandingZone
var DialogueScene
var CurentStoryScript = "prout"

signal interaction_started(StoryScript)

func _ready():
	DialogueScene = get_node("/root/MapScene/UI/DialogueScene")
	self.interaction_started.connect(DialogueScene.Activate)

func interraction_start():
	$Indicator.show()
	interaction_started.emit(choose_storylet())
#charcher dialogue_scene
	
func interraction_stop():
	$Indicator.hide()

func choose_storylet():
	var res = load("res://Ink/test_dialogue_1.ink")
	return (res)
