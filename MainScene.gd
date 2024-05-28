extends Node

var arrow = load("res://ui/cursors/default.png")
var pin = load("res://ui/cursors/pin.png")
var talk = load("res://ui/cursors/talk_beige.png")

var is_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MapScene.can_take_input = true
	MusicPlayer.play()
	
	Input.set_custom_mouse_cursor(arrow, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(talk, Input.CURSOR_WAIT)
	
	play_intro()
	


func play_intro():
	$UI/Intro.show()
	$UI/Intro.play()
	$UI/TransitionScreen.show()
	await $UI/Intro.intro_finished
	
	var tween = get_tree().create_tween()
	tween.tween_property($UI/Intro, "modulate:a", 0, 0.3)
	$MapScene/Area/Erwan.interraction_start(true)
	await tween.finished
	$UI/Intro.hide()
	var timer = get_tree().create_timer(0.2)
	await timer.timeout
	$UI/TransitionScreen.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):

	if event.is_action_pressed("mute"): 
		MusicPlayer.mute_switch()
		return
	if event.is_action_pressed("show_map"):
		$UI/Map.visible = !$UI/Map.visible
		return
	if event.is_action_pressed("pause"):
		if is_paused:
			unpause()
		else:
			pause()
		return
		
func pause():
	$UI/PauseMenu.enter_screen()
	
func unpause():
	$UI/PauseMenu.exit_screen()
