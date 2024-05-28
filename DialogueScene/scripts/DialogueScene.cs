using Godot;
using GodotInk;
using Ink;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public partial class DialogueScene : Control
{

	[Signal]
    public delegate void DesactivatedEventHandler();

	private bool Activated;
	private int CharacterInt;
	private bool skipIntro;

	private string oldRightCharacter;
	private string oldLeftCharacter;

	private Node localSequenceManager;

	private AudioStreamPlayer RelationUpSound;

	private InkStory story;
	private Sprite2D BackgroundSprite;
	private MarginContainer Foreground;
	private MarginContainer Sprites;
	private HBoxContainer DialogueContainer;
	private MarginContainer NameContainer;
	private MarginContainer UIContainer;
	private Label PlaceNameLabel;
	private ColorRect BlueFilter;
	private MarginContainer TrucGaucheDroite;
	//ptdr je me déteste avec mes noms de variables olala, mais en gros c'est le margin container qui décide si la bulle de texte est allignée à gauche où à droite
	private Label CoreText;
	private Label NameText;
	private Sprite2D RightSprite;
	private Sprite2D LeftSprite;
	private TextureRect LeftSpeechIndicator;
	private TextureRect RightSpeechIndicator;

	private bool CanClick = true;

	private List<String> GlobalTags;
	private List<String> LineTags;
	private List<List<String>> Characters;
	//For each character contains: id, name, side

	private Color BlueModulation;
	private Color DefaultModulation;
	private Color FadeBlackModulation;
	private Color FadeModulation;

//	private Texture2D brianne_default;
//	private Texture2D adriana_default;


	public override void _Ready()
	{	
		Activated = false;
		

		localSequenceManager = GetNode<Node>("LocalSequenceManager");

		RelationUpSound = GetNode<AudioStreamPlayer>("RelationUpSound");

		Foreground = GetNode<MarginContainer>("ForegroundContainer");
		Sprites = Foreground.GetNode<MarginContainer>("Sprites");
		DialogueContainer = Foreground.GetNode<HBoxContainer>("DialogueContainer");
		UIContainer = GetNode<MarginContainer>("UIContainer");
		NameContainer = UIContainer.GetNode<MarginContainer>("NameContainer");
		PlaceNameLabel = NameContainer.GetNode<Label>("Label");

		BlueFilter = GetNode<ColorRect>("BlueFilter");
		BackgroundSprite = GetNode<Sprite2D>("BackgroundContainer/BackgroundSprite");

		TrucGaucheDroite = GetNode<MarginContainer>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer");
		CoreText = GetNode<Label>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer/VBoxContainer/Core");
		NameText = GetNode<Label>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer/VBoxContainer/NameMargin/Name");
		RightSprite = GetNode<Sprite2D>("ForegroundContainer/Sprites/RightSpriteContainer/RightSprite");
		LeftSprite = GetNode<Sprite2D>("ForegroundContainer/Sprites/LeftSpriteContainer/LeftSprite");
		LeftSpeechIndicator = GetNode<TextureRect>("ForegroundContainer/DialogueContainer/TextBoxContainer/TextureRect/SpeechLeft");
		RightSpeechIndicator = GetNode<TextureRect>("ForegroundContainer/DialogueContainer/TextBoxContainer/TextureRect/SpeechRight");

		BlueModulation = new Color(0.7f,0.7f, 0.9f, 1.0f);
		DefaultModulation = new Color(1.0f, 1.0f, 1.0f, 1.0f);
		FadeBlackModulation = new Color(0.0f,0.0f,0.0f,0.0f);
		FadeModulation = new Color(1.0f, 1.0f, 1.0f, 0.0f);
		

//		brianne_default = GD.Load<Texture2D>("res://Characters/Sprites/brianne_default");
//		adriana_default = GD.Load<Texture2D>("res://Characters/Sprites/adriana_default");

	}

	public override async void _Input(InputEvent @event)
	{
		if (@event.IsActionPressed ("left_click"))
		{
			if (Activated)
				if (story.CanContinue)
				{
					ContinueStory();
					CanClick = false;
					SceneTreeTimer timer = GetTree().CreateTimer(0.2);
					await ToSignal(timer, "timeout");
					CanClick = true;
				}
				else
				{
					Desactivate();
				}
		}
	}

	private void SetUp(Resource Sequence, int Character, String placeName, bool skipIntroParam)
	{

		CharacterInt = Character;
		PlaceNameLabel.Text = placeName;
		skipIntro = skipIntroParam;

		oldRightCharacter = "";
		oldLeftCharacter = "";

		Foreground.Show();
		UIContainer.Show();

		localSequenceManager.Call("load_sequence", Sequence, CharacterInt);
	}
	private async void Activate(InkStory StoryScript, String CharacterString)
	{	
		Tween tween;
		SceneTreeTimer timer;
		ResetAnimations();

		Activated = true;
		Visible = true;

		timer = GetTree().CreateTimer(0.3);
		await ToSignal(timer, "timeout");
		
		

		tween = GetTree().CreateTween();
		tween.TweenProperty(this, "modulate", DefaultModulation, 0.2);

		story = StoryScript;
		//story.Continue();
		story.ResetCallstack();
		story.ChoosePathString(CharacterString);
		//story.Continue();
		
		StartDialogue();
	}

	private void ResetAnimations()
	{
		this.Modulate = FadeModulation;
		Foreground.Modulate = DefaultModulation;
		BlueFilter.Modulate = FadeModulation;
		Sprites.Modulate = new Color(1.0f, 1.0f, 1.0f, 0.0f);
		LeftSprite.Modulate = DefaultModulation;
		RightSprite.Modulate = DefaultModulation;
		DialogueContainer.Modulate = new Color(1.0f, 1.0f, 1.0f, 0.0f);
		NameContainer.Modulate = FadeModulation;
		
	}
	private async void Desactivate()
	{
		Tween tween;
		SceneTreeTimer timer;

		story.ResetCallstack();
		Activated = false;
		

		tween = GetTree().CreateTween();
		tween.TweenProperty(Foreground, "modulate", FadeBlackModulation, 0.1);
		await ToSignal(tween, "finished");

		timer = GetTree().CreateTimer(0.5);
		await ToSignal(timer, "timeout");

		tween = GetTree().CreateTween();
		tween.TweenProperty(this, "modulate", FadeBlackModulation, 0.1);
		await ToSignal(tween, "finished");
		
		Visible = false;

		EmitSignal(SignalName.Desactivated);
	}

	private async void StartDialogue()
	{	
		Tween tween = GetTree().CreateTween();
		
		LeftSprite.Hide();
		RightSprite.Hide();
		
		
		if (story.CanContinue && Activated)
			{
				ContinueStory();
			}

		if (!skipIntro) {
			SceneTreeTimer startTimer = GetTree().CreateTimer(0.7);
			await ToSignal(startTimer, "timeout");

			UIContainer.Show();
			tween = GetTree().CreateTween();
			tween.TweenProperty(NameContainer, "modulate",DefaultModulation , 0.3);
			await ToSignal(tween, "finished");

			SceneTreeTimer ForegroundTimer = GetTree().CreateTimer(2.0);
			await ToSignal(ForegroundTimer, "timeout");
			NameContainer.Modulate = FadeModulation;
		}

		//BlueFilter.Visible = true;
			
		Tween tweenFilter = GetTree().CreateTween();
		tweenFilter.TweenProperty(BlueFilter, "modulate", DefaultModulation, 0.1);
	
		tween = GetTree().CreateTween();
		tween.TweenProperty(Sprites, "modulate", new Color(1.0f, 1.0f, 1.0f, 1.0f), 0.1);
		await ToSignal(tween, "finished");

		//delay between the characters and the textbox appearance
		SceneTreeTimer textBoxTimer = GetTree().CreateTimer(0.4);
		await ToSignal(textBoxTimer, "timeout");
		//

		tween = GetTree().CreateTween();
		tween.TweenProperty(DialogueContainer, "modulate", new Color(1.0f, 1.0f, 1.0f, 1.0f), 0.1);
		await ToSignal(tween, "finished");
			


		GD.Print("showed foreground");
		//Foreground.Visible = true;
		
		
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
						EndOfSequence();
						break;
					case "ChangeMetric":
						//ChangeMetric, MetricString, ValueString, isAdding
						ChangeMetric(substrings[1], substrings[2], Convert.ToBoolean(substrings[3]));
						break;
					case "GetMetric":
						//GetMetric, MetricName
						GetMetric(substrings[1]);
						break;
					case "UpdateMap":
						//UpdateMap, ElementString, RemoveOrAdd
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
					SetUpBackground(RemovePrefix(story.CurrentTags[2]).Trim());
					
					LeftSprite.Hide();
					RightSprite.Hide();

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
				SetupCharacter();

				storyText = story.Continue();
				
			}
		}
		
		CoreText.Text = storyText;
		
		
		
	}
	private void SetUpBackground(string background)
	{
		String dirPath = "res://DialogueScene/Backgrounds";
		String spriteName = background +".png";
		Texture2D sprite;

		if (IsThereFile(dirPath, spriteName) || IsThereFile(dirPath, spriteName + ".remap") || IsThereFile(dirPath, spriteName + ".import"))
		{
			sprite = GD.Load<Texture2D>(dirPath + "/" + spriteName);
		}
		else
		{
			GD.Print("Background not found, used default background isntead. Background name:"+ background);
			sprite = GD.Load<Texture2D>(dirPath + "/default.png");
		}
		BackgroundSprite.Texture = sprite;
	}
	private void SetupCharacter()
	{
		foreach (List<String> subCharacter in Characters)
		{
			if (story.CurrentTags[1] == subCharacter[0])
			{	
				String dirPath = "res://DialogueScene/Characters/Sprites/" + subCharacter[0];
				String spriteName = story.CurrentTags[3] +".png";
					
				Texture2D sprite;
				
				if (story.CurrentTags[3] == "empty")
				{
					sprite = null;
				}

				else
				{
					
					

					if (IsThereFile(dirPath, spriteName) || IsThereFile(dirPath, spriteName + ".remap") || IsThereFile(dirPath, spriteName + ".import"))
					{
						sprite = ResourceLoader.Load<Texture2D>(dirPath + "/" + spriteName);
					}
					else
					{
						GD.Print("Sprite not found, used default sprite isntead. Sprite name:"+spriteName);
						sprite = ResourceLoader.Load<Texture2D>(dirPath + "/default.png");
					}
				}
				
				
				
				Sprite2D spriteNode;

				if (subCharacter[2] == "left")
				{
					spriteNode = LeftSprite;
					spriteNode.FlipH = true;

					if (oldLeftCharacter != subCharacter[0])
					{
						Tween tween = GetTree().CreateTween();
						LeftSprite.Position = new Vector2(-800, LeftSprite.Position.Y);
						/* tween.TweenProperty(LeftSprite, "position:x", -600, 0.2);
						tween.Parallel().TweenProperty(LeftSprite, "modulate", FadeModulation, 0.2); */
						
						tween.TweenProperty(LeftSprite, "position:x", 0, 0.2);
						/* tween.Parallel().TweenProperty(LeftSprite, "modulate", DefaultModulation, 0.1); */
						oldLeftCharacter = subCharacter[0];
					}
				}
				else
				{	
					spriteNode = RightSprite;

					if (oldRightCharacter != subCharacter[0])
					{
						Tween tween = GetTree().CreateTween();
						RightSprite.Position = new Vector2(800, RightSprite.Position.Y);
						/* tween.TweenProperty(RightSprite, "position:x", 600, 2);
						tween.Parallel().TweenProperty(RightSprite, "modulate", FadeModulation, 2); */
						
						tween.TweenProperty(RightSprite, "position:x", 0, 0.2);
						/* tween.Parallel().TweenProperty(RightSprite, "modulate", DefaultModulation, 1); */
						oldRightCharacter = subCharacter[0];
					}
				}

				if (story.CurrentTags[2] == "speaking")
				{
					if (subCharacter[2] == "left")
					{
						//TrucGaucheDroite.SizeFlagsHorizontal = Control.SizeFlags.ShrinkEnd;
						RightSpeechIndicator.Hide();
						LeftSpeechIndicator.Show();

						DialogueContainer.GetNode<Control>("FillerL").Hide();
						DialogueContainer.GetNode<Control>("FillerR").Show();
						
					}
					else
					{
						//TrucGaucheDroite.SizeFlagsHorizontal = Control.SizeFlags.ShrinkBegin;
						LeftSpeechIndicator.Hide();
						RightSpeechIndicator.Show();

						DialogueContainer.GetNode<Control>("FillerR").Hide();
						DialogueContainer.GetNode<Control>("FillerL").Show();
						
					}

					NameText.Text = subCharacter[1];
					spriteNode.ZIndex = 0;

					Tween tween = GetTree().CreateTween();
					tween.TweenProperty(spriteNode, "modulate", DefaultModulation, 0.1);
					
				}
				else
				{

					spriteNode.ZIndex = -11;

					Tween tween = GetTree().CreateTween();
					tween.TweenProperty(spriteNode, "modulate", BlueModulation, 0.1);
				}

				spriteNode.Texture = sprite;
				
				spriteNode.Show();
			} 
			
		}
		
	}

	public void ChangeMetric(String Metric, String Value, bool isAdding = false)
	{
		localSequenceManager.Call("change_metric", Metric, Value, isAdding);
		List<String> opinions = new List<string>() {"erwan_opinion", "brianne_opinion", "gwen_opinion", "yoann_opinion"};
		if (opinions.Contains(Metric))
		{
			RelationUpSound.Play();			
		}
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
