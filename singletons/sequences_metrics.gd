@tool
extends StateMachinesManager

enum AnEnum {
	CINDY,
	RICKY_LE_CHANTEUR_ANGLAIS
}


@export var example_property: AnEnum

func _validate_property(property: Dictionary) -> void:
	if property.name == "example_property":
		property.hint = PROPERTY_HINT_TYPE_STRING
		property.hint_string = "%d/%d:%s" % [TYPE_STRING, PROPERTY_HINT_FLAGS, enum_to_hint_string(AnEnum)]

static func enum_to_hint_string(an_enum: Dictionary) -> String:
	return ",".join(an_enum.keys().map(
		func (key: String) -> String:
			return "%s:%d" % [key, an_enum[key]]
	))

@export var eoliennes_IO = {
	"adriana": {
		"default": true,
		"sait_panne": false,
		"pieces_livrees": false, 
		"sait_reparations":false
	},
	"erwan": {
		"default": true, 
		"vu_adri": false
	},
	"brianne": {
		"default": true,
		"vu_adri":false
	}
}
