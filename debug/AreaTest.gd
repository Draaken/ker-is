extends Node2D


# Called when the node enters the scene tree for the first time.
func read_dialogue(sequence, character):
	$CanvasLayer/DebugInkReader.SetUp(sequence, character)
	$CanvasLayer/DebugInkReader.Activate(sequence, character)

func _input(event):
	if event.is_action_pressed("tab"):
		$CanvasLayer.visible = ! $CanvasLayer.visible
