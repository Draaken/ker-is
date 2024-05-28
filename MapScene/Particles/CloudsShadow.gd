extends Node2D

@onready var shader = $Sprite2D2

var random = RandomNumberGenerator.new()

var velocity = Vector2(0,0)
var speed = 0.5
var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(random.randf_range(-1.0,1.0), random.randf_range(-1.0,1.0))
	velocity = speed*direction



func _process(delta):
	pass
