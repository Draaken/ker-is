extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):

	if event.is_action_pressed("mute"):
		MusicPlayer.mute_switch()