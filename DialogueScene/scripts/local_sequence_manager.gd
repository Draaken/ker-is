extends Node
var current_sequence: SequenceClass

# Called when the node enters the scene tree for the first time.
func load_sequence(sequence, character_int):
	current_sequence = sequence
	var character_string = MetricsDatabase.characters_name[character_int]
	var ink_file = current_sequence.ink_file
	get_node("..").Activate(ink_file, character_string)


func end_of_sequence(character_int):
	if current_sequence.characters & character_int:
		current_sequence.characters -= character_int
	else:
		return
	if current_sequence.characters == 0: 
	#ie: it was the last character with storylets in the sequence
	#if that's the case we remove the sequence from the active sequences list
		remove_sequence()
	else:
		var can_be_continued = false
		var current_characters =current_sequence.characters
		#grave broken pour l'instant: ça fait aussi jouer le storylet de "get_priority"
		#au lecteur de dialogue :(
		
		await $"..".Desactivated
		for i in current_characters:
			if (current_characters & i+1) && ((i+1 & i))==0:
				if current_sequence.get_priority(i+1) != -1:
					can_be_continued = true
					break
		if not can_be_continued:
			remove_sequence()
			
			
func remove_sequence():
	current_sequence.characters = current_sequence.default_characters
	var active_sequences = SequencesManager.active_sequences.sequences
	for i in range(active_sequences.size()-1,-1,-1):
		if active_sequences[i] == current_sequence:
			active_sequences.remove_at(i)
			break
		
	#chose if the sequence is discarded or added back to the list of available sequences
	if current_sequence.one_use_only:
		SequencesManager.finished_sequences.sequences.append(current_sequence)
		print("Removing sequence from active l: "+ current_sequence.resource_path.get_file())
	else:
		SequencesManager.available_sequences.sequences.append(current_sequence)
		print("Adding sequence back to available list: "+ current_sequence.resource_path.get_file())


func change_metric(metric_string, value_string, is_adding = false):
	var metric = MetricsDatabase.METRICS_BY_NAME[metric_string]
	var metric_variable = MetricsDatabase.metrics_values_live[metric_string]
	if value_string.is_valid_int():
		if is_adding:
			metric_variable += int(value_string)
		else:
			metric_variable = int(value_string)
	else:
		var values = MetricsDatabase.METRICS_VALUES_BY_VALUES_STRING[metric]
		var new_value = values[value_string]
		if is_adding:
			metric_variable += new_value
		else:
			metric_variable = new_value
	print_debug("Change "+metric_string +": "+value_string)
func get_metric(metric_string):
	var value = MetricsDatabase.metrics_values_live[metric_string]
	$"..".story.StoreVariable(metric_string, value)
	print_debug("Get "+metric_string +": "+str(value))
