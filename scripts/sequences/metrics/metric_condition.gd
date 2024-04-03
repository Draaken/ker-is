@tool
extends Resource
class_name MetricCondition

const metrics_manager = preload("res://scripts/autoload/metrics_database.gd")
const metrics_enum = metrics_manager.metrics

enum logic_signs {
	EQUAL=1,
	STRICTLY_OVER=2,
	STRICTLY_UNDER=4,
	NOT=8
}

var metric: int
var logic: logic_signs
var metric_value: int



static func enum_to_hint_string(an_enum: Dictionary) -> String:
	return ",".join(an_enum.keys().map(
		func (key: String) -> String:
			return "%s:%d" % [key, an_enum[key]]
	))


func _get_property_list() -> Array[Dictionary]:
	
	var ret: Array[Dictionary] = []
	
	
	ret.append({
		name = "metric",
		type = TYPE_INT,
		hint = PROPERTY_HINT_ENUM,
		hint_string = enum_to_hint_string(metrics_enum),
		usage = PROPERTY_USAGE_DEFAULT,
	})
	ret.append({
		name = "logic",
		type = TYPE_INT,
		hint = PROPERTY_HINT_ENUM,
		hint_string = enum_to_hint_string(logic_signs),
		usage = PROPERTY_USAGE_DEFAULT
	})
	
		
	
		
	ret.append({
		name = "metric_value",
		type = TYPE_INT,
		hint = PROPERTY_HINT_ENUM,
		hint_string = enum_to_hint_string(metrics_manager.METRIC_VALUES_BY_TYPE[metric]),
		usage = PROPERTY_USAGE_DEFAULT
	})
	notify_property_list_changed()
	return ret



