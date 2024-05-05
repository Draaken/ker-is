using Godot;
using System;
using GodotInk;
using Ink;
using System.Collections.Generic;
using System.Data;
using Ink.Runtime;

[GlobalClass]
public partial class SequenceClassInkReader : Resource
{
    private InkStory story;
    private string stateBackup;

    private bool SetUpStorylet(InkStory Sequence, string Character)
    {
        story = Sequence;


        stateBackup = story.SaveState();
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
        story.LoadState(stateBackup);
        return priority;
    }
}
