extends Node2D
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.speed_scale = random.randfn(MapParameters.wind_intensity, 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
