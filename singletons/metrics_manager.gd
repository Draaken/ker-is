@tool

extends StateMachinesManager

const metrics: Dictionary = {
	"storm": {
		"NONE": 1,
		"COMING": 2,
		"FINISHING":4
	}
	
}

enum characters {
	BRIANNE=1,
	ERWAN=2,
	YOANN=4
}

enum storm {
	NONE=1,
	COMING=2,
	STRONG=4,
	FINISHING=8
}

enum state_pressure {
	NONE=1,
	COMING=2,
	STRONG=4,
	FINISHING=8
}

@export var SequencesPack: Resource

var Metrics: Dictionary = {
	"storm" : storm
	
}
#@export var Storm = {
	#
	#"none": true, 
	#"coming": false, 
	#"strong": false, 
	#"finishing": false
#}
#@export var StatePressure = {
	#"none": true,
	#"coming": false, 
	#"strong" : false, 
	#"finishing": false
	#}

@export var Fuel = {
	"high":true,
	"very_low":false,
	"low":false
	}

@export var ConstructionIOProgress: int = 10 #0-100

@export var ConstructionIOState = {
	"stopped": false,
	"neutral": true,
	"restarted": false
}

@export var Zadio = {
	"none": true,
	"start": false,
	"active": false,
	"paused": false
} 



@export var AdriAttachement = {
	"low": true,
	"mid": false,
	"strong" : false
}

