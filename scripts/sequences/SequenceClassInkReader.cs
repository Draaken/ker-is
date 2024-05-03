using Godot;
using System;
using GodotInk;
using Ink;
using System.Collections.Generic;

[GlobalClass]
public partial class SequenceClassInkReader : Resource
{
    private InkStory story;
    private bool SetUpStorylet(string Character)
    {
        story.ChoosePathString(Character);
        if (story.CanContinue)
        {
            String storyText = story.Continue();
            while (storyText.StartsWith(">>>DEBUG"))
            {
                GD.Print(storyText);
                if (story.CanContinue)
                {
                    storyText = story.Continue();
                }
                else
                {
                    return false;
                }
            }
            return true;
        }
        else
        {
            return false;
        }
    }
    private int GetPriority()
	{
        int priority = Int32.Parse(story.CurrentTags[1]);
        return priority;
    }
}
