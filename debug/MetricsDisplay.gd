extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = ""
	for i in MetricsDatabase.metrics_values_live:
		text += "%s : %d" % [i, MetricsDatabase.metrics_values_live[i]]
		if (i != MetricsDatabase.metrics_values_live.keys().back()):
			text += "\n"
