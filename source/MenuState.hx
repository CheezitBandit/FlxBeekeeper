package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;

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
        
        var instructions:FlxButton = new FlxButton(0, 125, "Instructions", InstructionState);
        instructions.screenCenter(X);
        add(instructions);
        
        var sprite:FlxSprite = new FlxSprite(100, 0);
        sprite.screenCenter(Y);
        sprite.loadGraphic(AssetPaths.beekeeper__png, false, 10, 20);
        add(sprite);

        var beesprite:FlxSprite = new FlxSprite(500, 0);
        beesprite.screenCenter(Y);
        beesprite.loadGraphic(AssetPaths.bee__png, false, 10, 20);
        add(beesprite);

        var beesprite1:FlxSprite = new FlxSprite(550, 0);
        beesprite1.screenCenter(Y);
        beesprite1.loadGraphic(AssetPaths.bee__png, false, 10, 20);
        add(beesprite1);

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

    function InstructionState():Void
    {
        FlxG.switchState(new InstructionState());
    }

    function EasyPlayState():Void
    {
        PlayState.hiveSize = 2;
        FlxG.switchState(new PlayState());
    }

    function MediumPlayState():Void
    {
        PlayState.hiveSize = 4;
        FlxG.switchState(new PlayState());
    }

    function HardPlayState():Void
    {
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