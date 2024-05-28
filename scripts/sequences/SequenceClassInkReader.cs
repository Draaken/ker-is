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
    public string stateBackup = null!;

    private bool SetUpStorylet(string Character)
    {
        
        story.ResetCallstack();
        GD.Print(Character);
        story.ChoosePathString(Character);
        if (story.CanContinue)
        {
            GD.Print("Can continue");
            String storyText = story.Continue();
            stateBackup = story.SaveState();
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
