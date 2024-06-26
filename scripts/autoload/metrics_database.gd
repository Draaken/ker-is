@tool

extends Node

enum metrics {
	storm,
	state_pressure,
	magneto_tech,
	zadio,
	IO_building,
	IO_building_state,
	treville_food,
	
	cassettes,
	
	yoann_opinion,
	erwan_opinion,
	brianne_opinion,
	gwen_opinion,
	erwan_stress,
	brianne_gwen_flirt,
	erwan_opinion_yoann,
	
}
const METRICS_NAME_BY_INDEX := {
	metrics.storm: "storm",
	metrics.state_pressure: "state_pressure",
	metrics.magneto_tech: "magneto_tech",
	metrics.zadio: "zadio",
	metrics.IO_building: "IO_building",
	metrics.IO_building_state: "IO_building_state",
	metrics.treville_food: "treville_food",
	
	metrics.cassettes: "cassettes",
	
	metrics.yoann_opinion: "yoann_opinion",
	metrics.erwan_opinion: "erwan_opinion",
	metrics.brianne_opinion: "brianne_opinion",
	metrics.gwen_opinion: "gwen_opinion",
	metrics.erwan_stress: "erwan_stress",
	metrics.brianne_gwen_flirt: "brianne_gwen_flirt",
	metrics.erwan_opinion_yoann: "erwan_opinion_yoann",
}

const METRICS_BY_NAME := {
	"storm": metrics.storm,
	"state_pressure": metrics.state_pressure,
	"magneto_tech": metrics.magneto_tech,
	"zadio": metrics.zadio,
	"IO_building": metrics.IO_building,
	"IO_building_state": metrics.IO_building_state,
	"treville_food": metrics.treville_food,
	
	"cassettes": metrics.cassettes,
	
	"yoann_opinion": metrics.yoann_opinion,
	"erwan_opinion": metrics.erwan_opinion,
	"brianne_opinion": metrics.brianne_opinion,
	"gwen_opinion": metrics.gwen_opinion,
	"erwan_stress": metrics.erwan_stress,
	"brianne_gwen_flirt": metrics.brianne_gwen_flirt,
	"erwan_opinion_yoann": metrics.erwan_opinion_yoann,
}

#dictionary that connect the metric to it's possible values
#used by the metric_condition ressource to match the selected metric with the values it can take
const METRIC_VALUES_BY_TYPE := { 
	metrics.storm: storm,
	metrics.state_pressure: state_pressure,
	metrics.magneto_tech: magneto_tech,
	metrics.zadio: zadio,
	metrics.IO_building: "range",
	metrics.IO_building_state: IO_building_state,
	metrics.treville_food: treville_food,
	
	metrics.cassettes: cassettes,
	
	metrics.yoann_opinion: "range",
	metrics.erwan_opinion : "range",
	metrics.brianne_opinion: "range",
	metrics.gwen_opinion: "range",
	metrics.erwan_stress: "range",
	metrics.brianne_gwen_flirt: "range",
	metrics.erwan_opinion_yoann: "range",
}

const METRICS_VALUES_BY_VALUES_STRING := {
	metrics.storm: storm_string,
	metrics.state_pressure: state_pressure_string,
	metrics.magneto_tech: magneto_tech_string,
	metrics.zadio: zadio_string,
	metrics.IO_building_state: IO_building_state_string,
	metrics.treville_food: treville_food_string,
	
	metrics.cassettes: cassettes_string,
}


#the metrics updated at runtime. This is what should be saved
var metrics_values_live = {
	"storm" : storm.FINISHING,
	"state_pressure": state_pressure.COMING,
	"magneto_tech": magneto_tech.NONE,
	"zadio": zadio.NONE,
	"IO_building": 0,
	"IO_building_state": IO_building_state.GOING,
	"treville_food": treville_food.NORMAL,
	
	"cassettes": 0,
	
	"yoann_opinion": 0,
	"erwan_opinion": 0,
	"brianne_opinion": 0,
	"gwen_opinion": 0,
	"erwan_stress": 0,
	"brianne_gwen_flirt": 0,
	"erwan_opinion_yoann": 0,
}

enum characters {
	IO=1,
	ERWAN=2,
	IMAK=4,
	ABANDONNED_VILLA=8,
	TREVILLE=16,
}
const characters_name = {
	characters.IO: "IO",
	characters.ERWAN: "ERWAN",
	characters.IMAK: "IMAK",
	characters.ABANDONNED_VILLA: "ABANDONNED_VILLA",
	characters.TREVILLE: "TREVILLE",
}

const characters_player_name = {
	characters.IO: "Ile Ouest",
	characters.ERWAN: "Atelier d'Erwan",
	characters.IMAK: "Ile Musicalement Autogérée de Kermevin",
	characters.ABANDONNED_VILLA: "Villa abandonnée",
	characters.TREVILLE: "Tréville-en-Mer",
}

enum storm {
	NONE=1,
	COMING=2,
	STRONG=4,
	FINISHING=8
}
const storm_string := {
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
	ACTIVE=4,
	PAUSED=8,
}

const zadio_string :={
	"NONE": zadio.NONE,
	"START": zadio.START,
	"ACTIVE": zadio.ACTIVE,
	"PAUSED": zadio.PAUSED,
}

enum IO_building_state {
	FINISHED=1,
	PAUSED=2,
	RESTARTED=4,
	GOING=8,
}

const IO_building_state_string :={
	"FINISHED": IO_building_state.FINISHED,
	"PAUSED": IO_building_state.PAUSED,
	"RESTARTED": IO_building_state.RESTARTED,
	"GOING": IO_building_state.GOING,
}

enum treville_food {
	LOW=1,
	NORMAL=2,
	HIGH=4,
}

const treville_food_string :={
	"LOW": treville_food.LOW,
	"NORMAL": treville_food.NORMAL,
	"HIGH": treville_food.HIGH,
}

enum cassettes {
	THE_RAGING_THINGS_1=1,
	SURF_AND_BASS=2,
}

const cassettes_string :={
	"THE_RAGING_THINGS_1": cassettes.THE_RAGING_THINGS_1,
	"SURF_AND_BASS": cassettes.SURF_AND_BASS,
}


