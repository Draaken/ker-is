@tool

extends Node

enum metrics {
	storm,
	state_pressure,
}
	

#dictionary that connect the metric to it's possible values
#used by the metric_condition ressource to match the selected metric with the values it can take
const METRIC_VALUES_BY_TYPE := { 
	metrics.storm: storm,
	metrics.state_pressure: state_pressure
}

var metrics_values = {
	metrics.storm : storm.FINISHING,
	metrics.state_pressure: state_pressure.COMING
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
var storm_value: storm = storm.NONE

enum state_pressure {
	NONE=1,
	COMING=2,
	STRONG=4,
	FINISHING=8
}
var state_pressure_value: state_pressure = state_pressure.COMING




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

