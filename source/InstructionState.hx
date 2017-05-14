package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;

class InstructionState extends FlxState
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
        
        var text:FlxText = new FlxText(0, 125, 0, "How To Play:", 18, true);
        text.screenCenter(X);
        add(text);


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