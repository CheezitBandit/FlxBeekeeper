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

        var title:FlxText = new FlxText(0, 50, 0, "Beekeeper", 48, true);
        title.borderStyle = OUTLINE;
        title.borderColor = FlxColor.YELLOW;
        title.borderSize = 2;
        title.color = FlxColor.BLACK;
        title.screenCenter(X);
        add(title);
        
        var text:FlxText = new FlxText(0, 200, 0, "Difficulty:", 18, true);
        text.screenCenter(X);
        add(text);
        
        var easy:FlxButton = new FlxButton(0, 250, "Easy", EasyPlayState);
        easy.screenCenter(X);
        add(easy);

        var medium:FlxButton = new FlxButton(0, 300, "Medium", MediumPlayState);
        medium.screenCenter(X);
        add(medium);

        var hard:FlxButton = new FlxButton(0, 350, "Hard", HardPlayState);
        hard.screenCenter(X);
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