@tool
extends Path2D
var handles_offset = 10
var l := Line2D.new()   
# Called when the node enters the scene tree for the first time.
func _ready():
	material.set_shader_parameter("offset", global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var new_out = Vector2(curve.get_point_out(0).x, handles_offset)
	#var new_in = Vector2(curve.get_point_in(1).x, handles_offset)
	#curve.set_point_out(0, new_out)
	#curve.set_point_in(1, new_in)
	
	$Line2D.points = curve.get_baked_points()
	

	

