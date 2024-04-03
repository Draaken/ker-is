@tool
extends AnimatedSprite2D

@export var Manual: bool = false:
	set(value):
		Manual = value
		update_manual(value)
		
var max_deformation: float = 0.0
var current_deformationY: float = 0.0
var random = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()
	#current_deformationY = random.randi_range(-0.02, 0.02)
	#update_deformation()
	
	var rand_scale = clamp(random.randfn(1.0,0.1), 0.8, 1.2)
	if random.randi_range(0,1) == 1:
		flip_h = true
	scale = Vector2(rand_scale, rand_scale)
	material.set_shader_parameter("offset", global_position)
	
	if Manual == false:
		frame = random.randi_range(0, sprite_frames.get_frame_count(animation)) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#material.set_shader_parameter("deformation", Vector2(max_deformation, current_deformationY))
	pass


func update_manual(value):
	if value == false:
		frame = random.randi_range(0, sprite_frames.get_frame_count(animation)) 

func update_deformation():
	#print(random.randf())
	#max_deformation = (get_node("/root/MapParameters").wind_intensity + randi_range(-0.2, 0.2)) /20.0
	#
	#var tween = create_tween().set_loops()
	##tween.set_trans(Tween.TRANS_ELASTIC)
	#var timing_in = random.randf_range(0.5,1.5)
	#var timing_out = random.randf_range(1.5,2.5)
	#print(timing_in)
	#tween.set_ease(Tween.EASE_IN_OUT)
	#tween.tween_property(self, "current_deformationY", max_deformation, timing_in)
	#tween.tween_property(self, "current_deformationY", 0.0, timing_out)
	pass
