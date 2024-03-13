extends Node2D

var type #Flying, Landing

# Called when the node enters the scene tree for the first time.
func _ready():
	if type == "Flying":
		$Polygon2D.color = Color("orange")
	if type == "Landing":
		$Polygon2D.color = Color("darkred")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
