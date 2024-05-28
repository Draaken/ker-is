using Godot;
using GodotInk;
using Ink;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public partial class DebugInkReader : VBoxContainer
{
	[Signal]
    public delegate void DesactivatedEventHandler();
	private bool Activated;
	private int CharacterInt;
	private Node localSequenceManager;
	private InkStory story;

	//ptdr je me déteste avec mes noms de variables olala, mais en gros c'est le margin container qui décide si la bulle de texte est allignée à gauche où à droite

	private Label NameText;



	private List<String> GlobalTags;
	private List<String> LineTags;
	private List<List<String>> Characters;
	//For each character contains: id, name, side



	public override void _Ready()
	{	
		Activated = false;
		localSequenceManager = GetNode<Node>("LocalSequenceManager");



	}

	public void Display()
	{
	
		while (story.CanContinue && Activated)
		{
			ContinueStory();
		}
		

		
	}

	private void SetUp(Resource Sequence, int Character)
	{
		CharacterInt = Character;
		localSequenceManager.Call("load_sequence", Sequence, CharacterInt);
	}
	private void Activate(InkStory StoryScript, String CharacterString)
	{
		Activated = true;
		Visible = true;
		story = StoryScript;
		story.ChoosePathString(CharacterString);

		StartDialogue();
		Display();	
	}

	private void Desactivate()
	{
		story.ResetCallstack();
		Activated = false;
		EmitSignal(SignalName.Desactivated);

	}


	private void StartDialogue()
	{	

		Label content = new();
		content.Text = "\n\n ----------------\n\n";
		AddChild(content);
		
	}

	private void ContinueStory()
	{
		String storyText = story.Continue();
		GD.Print("story continued");
		while (storyText.StartsWith(">>"))
			{
				if (storyText.StartsWith(">>>DEBUG"))
				{
					GD.Print(storyText);
					storyText = story.Continue();
					continue;
				}

				String line = storyText;
				String function_to_call = line.Right(2);
				string[] substrings = function_to_call.Split(",");
				for(int i=0; i<substrings.Length; i++)
				{
					substrings[i] = substrings[i].Trim();
				}
				switch(substrings[0])
				{
					case "EndOfSequence":
						//>>EndOfSequence
						EndOfSequence();
						break;
					case "ChangeMetric":
						//>>ChangeMetric, MetricString, ValueString, isAdding
						ChangeMetric(substrings[1], substrings[2], Convert.ToBoolean(substrings[3]));
						break;
					case "GetMetric":
						//GetMetric, MetricName
						GetMetric(substrings[1]);
						break;
					case "UpdateMap":
						//>>UpdateMap, ElementString, RemoveOrAdd
						break;
					default: 
						GD.Print("Error: Cannot convert the following instruction from InkFile:"+substrings[0]);
						break;
				}
				storyText = story.Continue();
			}
		while (story.CurrentTags.Any() && (story.CurrentTags[0] == "skip" || story.CurrentTags[0] == "knot" || story.CurrentTags[0] == "c"))
		{
			if (story.CurrentTags[0] == "skip")
				{

					storyText = story.Continue();
				}

			else if (story.CurrentTags[0] == "knot")
				{
					Characters = new List<List<String>>{};
					int CharactersNumber = Int32.Parse(RemovePrefix(story.CurrentTags[3]));
					for (int i=0; i< CharactersNumber; i++)
					{
						int j = i*3 + 4;

						
						Characters.Add(new List<String>{});
							Characters[i].Add(RemovePrefix(story.CurrentTags[j]));
							Characters[i].Add(RemovePrefix(story.CurrentTags[j+1]));
							Characters[i].Add(RemovePrefix(story.CurrentTags[j+2]));
							
							
					}

					foreach(List<String> subList in Characters)
					{
						foreach(string item in subList)
						{
							GD.Print(item);
						}
					}
					storyText = story.Continue();
					
				}

			else if (story.CurrentTags[0] == "c")
			{
				

				storyText = story.Continue();
				
			}
		}
		
		Label content = new();
		content.Text = storyText;
		AddChild(content);
		
		
		
	}

	
		

	public void ChangeMetric(String Metric, String Value, bool isAdding = false)
	{
		localSequenceManager.Call("change_metric", Metric, Value, isAdding);
		//Node metricDatabase = GetNode<Node>("/root/metrics_database");
		
		//int int_value;
		//if (int.TryParse(Value, out int_value))
		//{
		//	if (isAdding)
		//	{
		//
		//	}
			//mettre int_value dans la variable de destination	
		//}
		//else
		//{
			//match le string au int et le mettre dans la variable de destination
		//}
	}
	public void GetMetric(string MetricName)
	{
		localSequenceManager.Call("get_metric", MetricName);
	}
	public void EndOfSequence()
	{
		localSequenceManager.Call("end_of_sequence", CharacterInt);
	}

	public void TriggerEvent(String eventName)
	{
		switch(eventName)
		{
		
		}
	}


	private String RemovePrefix(String Text)
	{
		return Text.Right(Text.Find(":")+1);
	}


	public static bool IsThereFile(string dirPath, string fileNameTarget)
{
    using var dir = DirAccess.Open(dirPath);
    if (dir != null)
    {
        if (dir.FileExists(fileNameTarget))
		{
			return true;
		}
		else
		{
			return false;
		}
    }
    else
    {
        GD.Print("An error occurred when trying to access the path.");
		return false;
    }
}



}
