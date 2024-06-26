extends Control


func enter_screen():
	$AnimationPlayer.stop()
	show()
	$AnimationPlayer.play("slide_in")
	
func exit_screen():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("slide_out")
	var animation = await $AnimationPlayer.animation_finished
	if animation == "slide_out":
		hide()


func _on_exit_button_pressed():
	get_tree().quit()


func _on_restart_button_pressed():
	print(get_tree().reload_current_scene())
