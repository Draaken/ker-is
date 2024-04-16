@tool

extends Node

enum metrics {
	storm,
	state_pressure,
	magneto_tech,
	zadio,
	
	cassettes,
	
	yoann_opinion,
	erwan_stress,
}
const METRICS_BY_NAME := {
	metrics.storm: "storm",
	metrics.state_pressure: "state_pressure",
	metrics.magneto_tech: "magneto_tech",
	metrics.zadio: "zadio",
	
	metrics.cassettes: "cassettes",
	
	metrics.yoann_opinion: "yoann_opinion",
	metrics.erwan_stress: "erwan_stress",
}

#dictionary that connect the metric to it's possible values
#used by the metric_condition ressource to match the selected metric with the values it can take
const METRIC_VALUES_BY_TYPE := { 
	metrics.storm: storm,
	metrics.state_pressure: state_pressure,
	metrics.magneto_tech: magneto_tech,
	metrics.zadio: zadio,
	
	metrics.cassettes: cassettes,
	
	metrics.yoann_opinion: "range",
	metrics.erwan_stress: "range",
}

const METRICS_VALUES_BY_VALUES_STRING := {
	metrics.storm: storm_state_string,
	metrics.state_pressure: state_pressure_string,
	metrics.magneto_tech: magneto_tech_string,
	metrics.zadio: zadio_string,
	
	metrics.cassettes: cassettes_string,
}


#the metrics updated at runtime. This is what should be saved
var metrics_values_live = {
	"storm" : storm.FINISHING,
	"state_pressure": state_pressure.COMING,
	"magneto_tech": magneto_tech.NONE,
	"zadio": zadio.NONE,
	
	"cassettes": 0,
	
	"yoann_opinion": 0,
	"erwan_stress": 0
}

enum characters {
	IO=1,
	ERWAN=2,
	IMAK=4,
	ABANDONNED_VILLA=8,
}
const characters_name = {
	characters.IO: "IO",
	characters.ERWAN: "ERWAN",
	characters.IMAK: "IMAK",
	characters.ABANDONNED_VILLA: "ABANDONNED_VILLA",
}

enum storm {
	NONE=1,
	COMING=2,
	STRONG=4,
	FINISHING=8
}
const storm_state_string := {
	"NONE": storm.NONE,
	"COMING": storm.COMING,
	"STRONG": storm.STRONG,
	"FINISHING": storm.FINISHING,
}

enum state_pressure {
	NONE=1,
	COMING=2,
	STRONG=4,
	FINISHING=8
}
const state_pressure_string := {
	"NONE": state_pressure.NONE,
	"COMING": state_pressure.COMING,
	"STRONG": state_pressure.STRONG,
	"FINISHING": state_pressure.FINISHING,
}
#var state_pressure_value: state_pressure = state_pressure.COMING

enum magneto_tech {
	NONE=1,
	AUDIO=2,
	AUDIO_ADRI=4,
	VIDEO=8,
}

const magneto_tech_string :={
	"NONE": magneto_tech.NONE,
	"AUDIO": magneto_tech.AUDIO,
	"AUDIO_ADRI": magneto_tech.AUDIO_ADRI,
	"VIDEO": magneto_tech.VIDEO
}

enum zadio {
	NONE=1,
	START=2,
	MUSIC=4,
	ACTIVE=8,
	PAUSED=16,
}

const zadio_string :={
	"NONE": zadio.NONE,
	"START": zadio.START,
	"MUSIC": zadio.MUSIC,
	"ACTIVE": zadio.ACTIVE,
	"PAUSED": zadio.PAUSED,
}

enum cassettes {
	THE_RAGING_THINGS_1=1,
}

const cassettes_string :={
	"THE_RAGING_THINGS_1": cassettes.THE_RAGING_THINGS_1
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

