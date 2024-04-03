@tool
extends Resource
class_name Sequence

const metrics_manager = preload("res://singletons/metrics_manager.gd")
const characters_enum = metrics_manager.characters
const metrics: Dictionary = metrics_manager.metrics
var conditions_number: int
@export var conditions : Array[MetricCondition]
var starter : characters_enum
@export var one_use_only = true
@export var ink_file: InkStory
@export var local_metrics = {}

enum logic_signs {
	EQUAL=1,
	STRICTLY_OVER=2,
	STRICTLY_UNDER=4,
	NOT=8
}

var metric: String
var logic: logic_signs
var metric_value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body .


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


static func enum_to_hint_string(an_enum: Dictionary) -> String:
	return ",".join(an_enum.keys().map(
		func (key: String) -> String:
			return "%s:%d" % [key, an_enum[key]]
	))

#func _set(prop_name: StringName, val) -> bool:
	## Assume the property exists
	#var retval: bool = true
	#
	#match prop_name:
	#
		#"Metric Value":
			#conditions[3]
		#
		#_:
			## If here, trying to set a property we are not manually dealing with.
			#retval = false
	#
	#return retval

#func _get(prop_name: StringName):
	#match prop_name:
		#"Metric Value":
			#return conditions
		#
	#return null

func _get_property_list() -> Array[Dictionary]:
	var ret: Array[Dictionary] = []
	
	ret.append({
		name = "starter",
		type = TYPE_INT,
		hint = PROPERTY_HINT_FLAGS,
		hint_string = enum_to_hint_string(characters_enum),
		usage = PROPERTY_USAGE_DEFAULT
	})
	ret.append({
		name = "conditions_number",
		type = TYPE_INT
	})
	#var condition_array = []
	#for i in conditions_number-1:
		#condition_array.append({
			#name = "metric",
			#type = TYPE_STRING,
			#usage = PROPERTY_USAGE_DEFAULT
		#})
		#
		#condition_array.append({
			#name = "logic",
			#type = TYPE_INT,
			#hint = PROPERTY_HINT_ENUM,
			#hint_string = enum_to_hint_string(logic_signs),
			#usage = PROPERTY_USAGE_DEFAULT
			#
		#})
		#
		#var metric_value_enum
		#match metric:
			#"storm": 
				#const tem_val = metrics_manager.storm
				#metric_value_enum = tem_val
			#_: 
				#metric_value_enum = {}
				#print("rab")
		#
	#
		#
		#condition_array.append({
			#name = "metric_value",
			#type = TYPE_INT,
			#hint = PROPERTY_HINT_ENUM,
			#hint_string = enum_to_hint_string(metric_value_enum),
			#usage = PROPERTY_USAGE_DEFAULT
		#})
		#
	#conditions = condition_array
	
	#ret.append({
		#name = "conditions",
		#type = TYPE_ARRAY,
		#hint = PROPERTY_HINT_ARRAY_TYPE,
		#hint_string = "%d/%d:%s" % [
			#TYPE_OBJECT,
			#PROPERTY_HINT_RESOURCE_TYPE,
			#"MetricConditon"
		#],
		#usage = PROPERTY_USAGE_DEFAULT
	#
	#})
	
	#ret.append({
		#name = "Metric Value",
		#type = TYPE_INT
	#})
	notify_property_list_changed()
	return ret
	
	#return [
		#{
			#name = "starter",
			#type = TYPE_INT,
			#hint = PROPERTY_HINT_FLAGS,
			#hint_string = enum_to_hint_string(characters_enum)
			##hint_string = "%d/%d:%s" % [
				##TYPE_INT,
				##PROPERTY_HINT_FLAGS,
				##enum_to_hint_string(characters_enum)],
			##usage = PROPERTY_USAGE_DEFAULT,
		#},
	#]

#func _validate_property(property: Dictionary):
	#if property.name == "sequence":
		#property.hint = PROPERTY_HINT_FLAGS
		#property.hint_string = enum_to_hint_string(characters_enum)
		##property.hint_string = "%d/%d:%s" % [TYPE_INT, PROPERTY_HINT_FLAGS, enum_to_hint_string(characters_enum)]
