extends Node
var random = RandomNumberGenerator.new()

@export var tracks: Array[AudioStream]
var available_tracks: Array[AudioStream] = []
var old_volume: int

@onready var TrackPlayer = $Player
@onready var TrackDelay = $TrackDelay

func _ready():
	random.randomize()
	available_tracks = tracks.duplicate()
	shuffle()

func play():
	TrackPlayer.play()

func mute_switch():
	if TrackPlayer.volume_db != -80:
		old_volume = TrackPlayer.volume_db
		TrackPlayer.volume_db = -80
	else:
		TrackPlayer.volume_db = old_volume

func shuffle():
	if available_tracks.size()==0:
		available_tracks = tracks.duplicate()
	var rand_index = random.randi_range(0,available_tracks.size()-1)
	TrackPlayer.stream = available_tracks[rand_index]
	available_tracks.remove_at(rand_index)

func change_volume(new_volume):
	TrackPlayer.volume_db = new_volume


func _on_track_finished():
	var rand_delay = random.randi_range(5,40)
	TrackDelay.wait_time = rand_delay
	TrackDelay.start()


func _on_track_delay_timeout():
	shuffle()
	play()
