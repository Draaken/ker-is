extends Node2D

@export_enum("Left", "Right", "Center") var orientation: String :
	set(value):
		orientation = value
		if is_inside_tree():
			setup()
		
		
func _ready():
	setup()

func setup():
	match orientation:
		"Left":
			$"MarginContainer/HBoxContainer/FillerL".hide()
			$"MarginContainer/HBoxContainer/FillerR".show()
			$MarginContainer/SpriteContainer.size_flags_horizontal = Control.SIZE_SHRINK_END
		"Right":
			$"MarginContainer/HBoxContainer/FillerL".show()
			$"MarginContainer/HBoxContainer/FillerR".hide()
			$MarginContainer/SpriteContainer.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
		"Center":
			$"MarginContainer/HBoxContainer/FillerL".show()
			$"MarginContainer/HBoxContainer/FillerR".show()
			$MarginContainer/SpriteContainer.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
		
func activate():
	show()

func desactivate():
	hide()

func start_dialogue(StoryScript):
	activate()
	pass
