package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;


class MenuState extends FlxState
{


    override public function create():Void
    {
        super.create();

        var title:FlxText = new FlxText(200, 50, 0, "Beekeeper", 48, true);
        title.borderStyle = OUTLINE;
        title.borderColor = FlxColor.YELLOW;
        title.borderSize = 2;
        title.color = FlxColor.BLACK;
        add(title);
        
        var text:FlxText = new FlxText(50, 200, 0, "Difficulty:", 18, true);
        add(text);
        
        var easy:FlxButton = new FlxButton(50, 250, "Easy", EasyPlayState);
        add(easy);

        var medium:FlxButton = new FlxButton(50, 300, "Medium", MediumPlayState);
        add(medium);

        var hard:FlxButton = new FlxButton(50, 350, "Hard", HardPlayState);
        add(hard);
    }

    function EasyPlayState():Void
    {
        trace("easy");
        PlayState.hiveSize = 2;
        FlxG.switchState(new PlayState());
    }

    function MediumPlayState():Void
    {
        trace("medium");
        PlayState.hiveSize = 4;
        FlxG.switchState(new PlayState());
    }

    function HardPlayState():Void
    {
        trace("hard");
        PlayState.hiveSize = 6;
        FlxG.switchState(new PlayState());
    }

    override public function update(elapsed):Void
    {
        super.update(elapsed);
    }

    override public function destroy():Void
    {
        super.destroy();
    }
}