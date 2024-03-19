using Godot;
using GodotInk;
using System;
using System.Collections.Generic;

public partial class DialogueScene : Node2D
{

	private InkStory story;
	private Label CoreText;
	private Label NameText;

	private List<String> GlobalTags;
	private List<String> LineTags;

	public override void _Ready()
	{
		CoreText = GetNode<Label>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer/VBoxContainer/Core");
		NameText = GetNode<Label>("ForegroundContainer/DialogueContainer/TextBoxContainer/MarginContainer/VBoxContainer/Name");
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

	private void Activate()
	{
		Visible = true;
		if (story.CanContinue)
			{
				ContinueStory();
				
			}
	}

	private void Desactivate()
	{
		Visible = false;
	}

	private void StartDialogue(InkStory StoryScript)
	{
		story = StoryScript;
        Activate();
	}

	private void ContinueStory()
	{
		GD.Print("story continued");
		CoreText.Text = story.Continue();
		NameText.Text = story.CurrentTags[0];
		
	}

	private void ReorderSprites(Node2D Sprite1, Node2D Sprite2)
	{

	}
}
