extends Node2D
var is_picking_click = true
signal intro_finished
var is_playing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if is_picking_click:
		if event.is_action_pressed("left_click"):
			if is_playing:
				emit_signal("intro_finished")
			else :
				is_playing = true
				is_picking_click = false
				play()
			
			


func _on_animation_player_animation_finished(anim_name):
	is_picking_click = true

func play():
	$AnimationPlayer.play("start")
