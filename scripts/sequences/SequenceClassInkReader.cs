using Godot;
using System;
using GodotInk;
using Ink;
using System.Collections.Generic;

[GlobalClass]
public partial class SequenceClassInkReader : Resource
{
    private InkStory story;
    private void SetUpStorylet(string Character)
    {
        story.ChoosePathString(Character);
        String storyText = story.Continue();
        while (storyText.StartsWith(">>>DEBUG"))
        {
            GD.Print(storyText);
            storyText = story.Continue();
        }
    }
    private int GetPriority()
	{
        int priority = Int32.Parse(story.CurrentTags[1]);
        return priority;
    }
}
