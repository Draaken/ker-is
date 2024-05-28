extends Node

var random = RandomNumberGenerator.new()
@export var available_sequences: SequencesPack
@export var active_sequences: SequencesPack
@export var finished_sequences: SequencesPack
var character_active_sequences: Array
var new_sequence_rand_factor = 0.4
# Called when the node enters the scene tree for the first time.

func _ready():
	random.randomize()

func choose_sequence_to_add(character: int)->SequenceClass:
	#--------------------------------------------------
	print("Trying to add new sequence to active list")
	#--------------------------------------------------
	var valid_sequences: Array[SequenceClass] = []
	
	if available_sequences.sequences.size()>0:
		var top_temp_priority = 0
		
		for temp_sequence in available_sequences.sequences:
			#check if the starter character correspond 
			var characters_mask = temp_sequence.starter_characters
			if (characters_mask & character) == character && temp_sequence.is_valid():
				if temp_sequence.priority == top_temp_priority:
					valid_sequences.append(temp_sequence)
				elif temp_sequence.priority > top_temp_priority:
					top_temp_priority = temp_sequence.priority
					valid_sequences = [temp_sequence]
					
					
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
	#choisi une séquence au hasard parmis toutes les séquences valides
	#peut potentiellement être problématique? Risque de sortir trop de séquences filler?
	#choisir celle avec le plus de condition?
	
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
		
		character_active_sequences = []
		for temp_sequence in active_sequences.sequences:
			var characters_mask = temp_sequence.characters
			if (characters_mask & character) == character:
				if temp_sequence.get_priority(character) != -1:
					character_active_sequences.append(temp_sequence)
				
		#among the active sequences, is there any for our character?
		if character_active_sequences.size() == 0:
			#if no sequences for our character, add a new one
			var new_sequence = choose_sequence_to_add(character)
			if new_sequence == null:
				print("No more valid sequences anywhere :(((")
			else:
				final_sequence = new_sequence
			active_sequences.sequences.append(final_sequence)
		else:
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
					var new_sequence_priority = new_sequence.get_priority(character)
					var old_sequence_priority = old_sequence.get_priority(character)
					if new_sequence_priority >= old_sequence_priority && old_sequence_priority < 3:
						final_sequence = new_sequence
						#add the sequence to the active ones so that it can be continued later
						active_sequences.sequences.append(new_sequence)
					#elif new_sequence.get_priority(character) == old_sequence.get_priority(character):
						#if random.randf_range(0.0,1.0) < 0.5:
					else:
						#if the sequence has less priority than the active ones,
						#or the active one is priority over 3 discard it
						final_sequence = old_sequence
						available_sequences.sequences.append(new_sequence)
						print("Added sequence back to available list:" + new_sequence.resource_path.get_file())
						#pourquoi ajouter la séquence puisque qu'elle n'est pas choisie?
						#peut être que c'était utile dans ce cas ouspy
						
						#active_sequences.sequences.append(new_sequence)
			else:
				final_sequence = choose_sequence_from_active(character)
	else: #no more sequence to play: we add a new one
		var new_sequence = choose_sequence_to_add(character)
		if new_sequence == null:
			print("No more valid sequences anywhere :(((")
		else:
			final_sequence = new_sequence
		active_sequences.sequences.append(final_sequence)
	
	#--------------------------------------------------
	print("Choosen sequence to play:" + final_sequence.resource_path.get_file())
	print("Priority:" + str(final_sequence.get_priority(character)))
	print("Characters:" +str(final_sequence.characters))
	#--------------------------------------------------
	return final_sequence

func force_sequence_to_play(sequence: SequenceClass):
	active_sequences.sequences.append(sequence)
	for i in available_sequences.sequences.size():
		if available_sequences.sequences[i] == sequence:
			available_sequences.sequences.remove_at(i)
			#--------------------------------------------------
			print("Removed sequence from available list:" + sequence.resource_path.get_file())
			#--------------------------------------------------
			break


func choose_sequence_from_active(character: int)->SequenceClass:
	#--------------------------------------------------
	print("Choosing a sequence from active sequences list")
	#--------------------------------------------------
	var best_priority = 0
	var top_sequences: Array[SequenceClass] = []
	for temp_sequence in character_active_sequences:
			
		var temp_sequence_priority = temp_sequence.get_priority(character)
		
		if temp_sequence_priority == -1:
			continue
		
		if temp_sequence_priority == best_priority:
			top_sequences.append(temp_sequence)
		#if the sequence priority is equal to the previous best, add to the list
			
		elif temp_sequence.get_priority(character) > best_priority:
			top_sequences = [temp_sequence]
			best_priority = temp_sequence_priority
		#if the sequence priority is over the previous best, erase the list and add it
		
	var random_index: int = random.randi_range(0, top_sequences.size()-1)
	var final_sequence = top_sequences[random_index]
	return final_sequence

