extends Node2D

var plane
var mouse_over_land = false

var pin_instance = preload("res://MapScene/Assets/pin.tscn")
var active_pin
# Called when the node enters the scene tree for the first time.
func _ready():
	plane = $"Plane"
	plane.PinReached.connect(pin_reached)
	
	#plane.Landing.connect($UI.landing)
	#plane.TakingOff.connect($UI.taking_off)
	
	
	
func _process(_delta):
	$UI/FPS.text = str(Engine.get_frames_per_second())
	

	
func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		set_pin("Flying")
	if event.is_action_pressed("right_click"):
		set_pin("Landing")
		

func set_pin(type):
	var mouse_position = get_global_mouse_position()
	var pin_instance = pin_instance.instantiate()
	pin_instance.type = type
	
	if $Pins.get_child_count() > 0:
		active_pin.queue_free()
	
	$"Pins".add_child(pin_instance)
	active_pin = pin_instance
	
	active_pin.position = mouse_position
	plane.new_target(active_pin)
	
#	if $"Pins".get_child_count() == 0:
#		instance = active_pin
	
func pin_reached():
	plane.stop(active_pin.type)
	active_pin.queue_free()
	
