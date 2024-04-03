extends Node

var random = RandomNumberGenerator.new()
@export var available_sequences: SequencesPack
@export var active_sequences: SequencesPack
var new_sequence_rand_factor = 0.3
# Called when the node enters the scene tree for the first time.

func _ready():
	random.randomize()

func choose_sequence_to_add(character: int)->SequenceClass:
	#--------------------------------------------------
	print("Trying to add new sequence to active list")
	#--------------------------------------------------
	var valid_sequences: Array[SequenceClass]
	
	if available_sequences.sequences.size()>0:
		for temp_sequence in available_sequences.sequences:
			#check if the starter character correspond 
			var characters_mask = temp_sequence.starter_characters
			if (characters_mask & character) == character && temp_sequence.is_valid():
				valid_sequences.append(temp_sequence)
		if valid_sequences.size() == 0:
			print("No more valid sequences available for this character :(")
			return null
	else:
		print("No more sequences available for this character :o")
		return null
	#--------------------------------------------------
	print("Adding new sequence to active list")
	print("--------------------------------")
	print("Valid sequences:")
	for i in valid_sequences:
		print(i.resource_path.get_file())
	print("--------------------------------")
	#--------------------------------------------------
	
	var random_index: int = random.randi_range(0, valid_sequences.size()-1)
	var final_sequence = valid_sequences[random_index]
	
	for i in available_sequences.sequences.size():
		if available_sequences.sequences[i] == final_sequence:
			available_sequences.sequences.remove_at(i)
			#--------------------------------------------------
			print("Removed sequence from available list:" + final_sequence.resource_path.get_file())
			#--------------------------------------------------
			break
	
	#--------------------------------------------------
	print("Added sequence to active list:" + final_sequence.resource_path.get_file())
	#--------------------------------------------------
	return final_sequence


#objectif: choisi aléatoirement entre démarer une nouvelle séquence, ou en poursuivre une en cours
#si poursui une séquence, détermine laquelle poursuivre
func choose_sequence_to_play(character: int)->SequenceClass:
	var final_sequence: SequenceClass
	
	#debug ---------------------------------------------------
	print("Character: "+str(character))
	print("Active sequences:")
	for i in active_sequences.sequences:
			print(i.resource_path.get_file())
	print("--------------------------------")
	
	print("Available sequences:")
	for i in available_sequences.sequences:
			print(i.resource_path.get_file())
	print("--------------------------------")
	#-----------------------------------------------------------
	
#So it's a little hardcore to understand, so i'm gonna help:
	if active_sequences.sequences.size() > 0:
		
		
		#if there's active sequences, randomly choose if we had a new one or not
		if random.randf_range(0.0,1.0) < new_sequence_rand_factor:
			#if we add new sequence, we first check if it's priority is higher than
			#the highest priority in the active sequence, to not interrupt action
			#with a petty sequence
			var new_sequence = choose_sequence_to_add(character)
			var old_sequence = choose_sequence_from_active(character)
			if new_sequence == null:
				final_sequence = choose_sequence_from_active(character)
			else:
				if new_sequence.get_priority(character) > old_sequence.get_priority(character):
					final_sequence = new_sequence
					#add the sequence to the active ones so that it can be continued later
					active_sequences.sequences.append(new_sequence)
				else:
					#if the sequence has less priority than the active ones, discard it
					final_sequence = old_sequence
					active_sequences.append(new_sequence)
		else:
			final_sequence = choose_sequence_from_active(character)
	else:
		var new_sequence = choose_sequence_to_add(character)
		if new_sequence == null:
			final_sequence = choose_sequence_from_active(character)
		else:
			final_sequence = new_sequence
		active_sequences.sequences.append(final_sequence)
	
	#--------------------------------------------------
	print("Choosen sequence to play:" + final_sequence.resource_path.get_file())
	print("Priority:" + str(final_sequence.get_priority(character)))
	#--------------------------------------------------
	return final_sequence



func choose_sequence_from_active(character: int)->SequenceClass:
	#--------------------------------------------------
	print("Choosing a sequence from active sequences list")
	#--------------------------------------------------
	var temp_priority = 0
	var top_sequences: Array[SequenceClass]
	for temp_sequence in active_sequences.sequences:
			
		if temp_sequence.get_priority(character) == temp_priority:
			top_sequences.append(temp_sequence)
		#if the sequence priority is equal to the previous best, add to the list
			
		elif temp_sequence.get_priority(character) > temp_priority:
			temp_priority = [temp_sequence]
		#if the sequence priority is over the previous best, erase the list and add it
		
	var random_index: int = random.randi_range(0, top_sequences.size()-1)
	var final_sequence = top_sequences[random_index]
	return final_sequence
