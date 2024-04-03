@tool
extends Resource
class_name MetricCondition

const metrics_manager = preload("res://singletons/metrics_manager.gd")

enum logic_signs {
	EQUAL=1,
	STRICTLY_OVER=2,
	STRICTLY_UNDER=4,
	NOT=8
}

var metric: String
var logic: logic_signs
var metric_value



static func enum_to_hint_string(an_enum: Dictionary) -> String:
	return ",".join(an_enum.keys().map(
		func (key: String) -> String:
			return "%s:%d" % [key, an_enum[key]]
	))


func _get_property_list() -> Array[Dictionary]:
	
	var ret: Array[Dictionary] = []
	
	
	ret.append({
		name = "metric",
		type = TYPE_STRING,
		usage = PROPERTY_USAGE_DEFAULT
	})
	ret.append({
		name = "logic",
		type = TYPE_INT,
		hint = PROPERTY_HINT_ENUM,
		hint_string = enum_to_hint_string(logic_signs),
		usage = PROPERTY_USAGE_DEFAULT
	})
	
	var metric_value_enum
	match metric:
		"storm": 
			const tem_val = metrics_manager.storm
			metric_value_enum = tem_val
		_: 
			metric_value_enum = {}
			print("rab")
		
	
		
	ret.append({
		name = "metric_value",
		type = TYPE_INT,
		hint = PROPERTY_HINT_ENUM,
		hint_string = enum_to_hint_string(metric_value_enum),
		usage = PROPERTY_USAGE_DEFAULT
	})
	notify_property_list_changed()
	return ret



