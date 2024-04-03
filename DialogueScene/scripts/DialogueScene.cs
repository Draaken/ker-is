using Godot;
using GodotInk;
using Ink;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public partial class DialogueScene : Node2D
{

	private InkStory story;
	private MarginContainer Foreground;
	private ColorRect BlueFilter;
	private MarginContainer TrucGaucheDroite;
	//ptdr je me déteste avec mes noms de variables olala, mais en gros c'est le margin container qui décide si la bulle de texte est allignée à gauche où à droite
	private Label CoreText;
	private Label NameText;
	private Sprite2D RightSprite;
	private Sprite2D LeftSprite;


	private List<String> GlobalTags;
	private List<String> LineTags;
	private List<List<String>> Characters;
	//For each character contains: id, name, side

//	private Texture2D brianne_default;
//	private Texture2D adriana_default;


	public override void _Ready()
	{	
		Foreground = GetNode<MarginContainer>("ForegroundContainer");
		BlueFilter = GetNode<ColorRect>("BlueFilter");
		BlueFilter.Visible = false;
		Foreground.Visible = false;

		TrucGaucheDroite = GetNode<MarginContainer>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer");
		CoreText = GetNode<Label>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer/VBoxContainer/Core");
		NameText = GetNode<Label>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer/VBoxContainer/Name");
		RightSprite = GetNode<Sprite2D>("ForegroundContainer/RightSpriteContainer/RightSprite");
		LeftSprite = GetNode<Sprite2D>("ForegroundContainer/LeftSpriteContainer/LeftSprite");

//		brianne_default = GD.Load<Texture2D>("res://Characters/Sprites/brianne_default");
//		adriana_default = GD.Load<Texture2D>("res://Characters/Sprites/adriana_default");

	}

	public override void _Input(InputEvent @event)
	{
		if (@event.IsActionPressed ("left_click"))
		{
			if (story.CanContinue)
			{
				ContinueStory();
			}
		}
	}

	private void Activate(InkStory StoryScript)
	{
		Visible = true;
		story = StoryScript;

		Timer timer = new() { WaitTime = 2.0, OneShot = true };
		AddChild(timer);
		timer.Start();
		timer.Timeout += delegate
		{
			StartDialogue();
			timer.QueueFree();
		};
		
		
		
	}

	private void Desactivate()
	{
		Visible = false;
	}

	private void StartDialogue()
	{	

		BlueFilter.Visible = true;
		if (story.CanContinue)
			{
				ContinueStory();
				
			}
		Timer timer = new() { WaitTime = 0.5, OneShot = true };
		AddChild(timer);
		timer.Start();
		timer.Timeout += delegate
		{
			GD.Print("showed foreground");
			Foreground.Visible = true;
			timer.QueueFree();
		};
		
	}

	private void ContinueStory()
	{
		String storyText = story.Continue();
		GD.Print("story continued");


		while (story.CurrentTags.Any() && (story.CurrentTags[0] == "skip" || story.CurrentTags[0] == "knot" || story.CurrentTags[0] == "c"))
		{
			if (story.CurrentTags[0] == "skip")
				{

					storyText = story.Continue();
				}

			else if (story.CurrentTags[0] == "knot")
				{
					Characters = new List<List<String>>{};
					for (int i=0; i< Int32.Parse(RemovePrefix(story.CurrentTags[2])); i++)
					{
						int j = i*3 + 3;

						
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

	private void SetupCharacter()
	{
		foreach (List<String> subCharacter in Characters)
		{
			if (story.CurrentTags[1] == subCharacter[0])
			{
				String dirPath = "DialogueScene/Characters/Sprites/" + subCharacter[1];
				String spriteName = story.CurrentTags[3] +".png";
				Texture2D sprite;

				if (IsThereFile(dirPath, spriteName))
				{
					sprite = GD.Load<Texture2D>(dirPath + "/" + spriteName);
				}
				else
				{
					GD.Print("Sprite not found, used default sprite isntead. Sprite name:"+spriteName);
					sprite = GD.Load<Texture2D>(dirPath + "/default.png");
				}
				
				Sprite2D spriteNode;

				if (subCharacter[2] == "left")
				{
					spriteNode = LeftSprite;
					spriteNode.Texture = sprite;
					spriteNode.FlipH = true;
				}
				else
				{	
					spriteNode = RightSprite;
					spriteNode.Texture = sprite;
				}

				if (story.CurrentTags[2] == "speaking")
				{
					if (subCharacter[2] == "left")
					{
						TrucGaucheDroite.SizeFlagsHorizontal = Control.SizeFlags.ShrinkEnd;
					}
					else
					{
						TrucGaucheDroite.SizeFlagsHorizontal = Control.SizeFlags.ShrinkBegin;
					}

					NameText.Text = subCharacter[1];
					spriteNode.ZIndex = 0;
				}
				else
				{
					spriteNode.ZIndex = -11;
				}

				break;
			} 
			
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
