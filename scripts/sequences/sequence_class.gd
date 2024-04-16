@tool
extends Resource
class_name SequenceClass


const characters_enum = MetricsDatabase.characters
@export var conditions : Array[MetricCondition]
var starter_characters : characters_enum
var characters : characters_enum
@export var one_use_only = true
@export var ink_file: InkStory
@export var local_metrics = {}
var ink_reader = preload("res://sequences/ink_reader.tres")


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
		name = "starter_characters",
		type = TYPE_INT,
		hint = PROPERTY_HINT_FLAGS,
		hint_string = enum_to_hint_string(characters_enum),
		usage = PROPERTY_USAGE_DEFAULT
	})
	
	ret.append({
		name = "characters",
		type = TYPE_INT,
		hint = PROPERTY_HINT_FLAGS,
		hint_string = enum_to_hint_string(characters_enum),
		usage = PROPERTY_USAGE_DEFAULT
	})
	notify_property_list_changed()
	return ret
	
#func get_enum_value(enum_variable):
	#var value = enum_variable
	#var key = enum_variable.keys()[enum_variable.keys().find(value)]
	#return key

func is_valid()->bool:
	if conditions.size() == 0:
		return true
	for i in conditions.size():
		var metric = conditions[i].metric
		var metric_name = MetricsDatabase.METRICS_BY_NAME[metric]
		var is_condition_true: bool
		var condition_value = conditions[i].metric_value
		var logic = conditions[i].logic
		
		var metric_value = MetricsDatabase.metrics_values_live[metric_name]
		
		match logic:
			0: is_condition_true = metric_value == condition_value
			1: is_condition_true = metric_value > condition_value
			2: is_condition_true = metric_value < condition_value
			3: is_condition_true = metric_value != condition_value
		
		#if one of the condition is false, return false
		if not is_condition_true:
			return false
		
	return true
	
func set_up_storylet(character:int):
	ink_reader.story = ink_file
	
	var character_string = MetricsDatabase.characters_name[character]
	ink_reader.SetUpStorylet(character_string)
#la il faudra:
# - convertir le int du character enum en un string
# - aller chercher le knot correspondant dans le fichier ink
# - jouer le knot pour tester les local_metrics de tous les sub-knots
# - la ressource est désormais à la première ligne du storylets concerné :thumbs_up:

func get_priority(character: int)->int:
	set_up_storylet(character)
#simple comme bonjour:
#suffit de retourner le tag de priority du storylet en cours
	return ink_reader.GetPriority()
	
	
	
	#var condition_array = []
	#for i in conditions_number:
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
