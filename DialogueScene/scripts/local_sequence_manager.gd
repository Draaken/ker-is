extends Node
var current_sequence: SequenceClass

# Called when the node enters the scene tree for the first time.
func load_sequence(sequence, character_int):
	current_sequence = sequence
	var character_string = MetricsDatabase.characters_name[character_int]
	var ink_file = current_sequence.ink_file
	get_node("..").Activate(ink_file, character_string)


func end_of_sequence(character_int):
	current_sequence.characters -= character_int
	if current_sequence.characters == 0: 
	#ie: it was the last character with storylets in the sequence
	#if that's the case we remove the sequence from the active sequences list
		var active_sequences = SequencesManager.active_sequences.sequences
		for i in range(active_sequences.size()-1,-1,-1):
			if active_sequences[i] == current_sequence:
				active_sequences.remove_at(i)
				break
		
		#chose if the sequence is discarded or added back to the list of available sequences
		if current_sequence.one_use_only:
			SequencesManager.finished_sequences.sequences.append(current_sequence)
		else:
			SequencesManager.available_sequences.sequences.append(current_sequence)
			
func change_metric(metric_string, value_string, is_adding = false):
	var metric = MetricsDatabase.METRICS_BY_NAME[metric_string]
	var metric_variable = MetricsDatabase.metrics_values_live[metric_string]
	if value_string.is_valid_integer():
		if is_adding:
			metric_variable += int(value_string)
		else:
			metric_variable = int(value_string)
	else:
		var new_value = MetricsDatabase.METRICS_VALUES_BY_VALUES_STRING[metric]
		metric_variable = new_value
		
