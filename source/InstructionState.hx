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

    var textInput:String;

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
        
        var title2:FlxText = new FlxText(0, 125, 0, "How To Play:", 18, true);
        title2.screenCenter(X);
        add(title2);

        textInput = "You are the beekeeper, and must collect honey\nwithout getting stung.\n\nUse the arrow keys to move and press shift to run.\n\nIf you pick a flower, drop it\nto attract bees by pressing space.\n\nGood luck!";
        var text:FlxText = new FlxText(0, 200, 0, textInput, 14, true);
        add(text);

        var sprite:FlxSprite = new FlxSprite(100, 400);
        sprite.loadGraphic(AssetPaths.beekeeper__png, false, 10, 20);
        add(sprite);
        var spriteText:FlxText = new FlxText(100, 450, 0, "Beekeeper", 12, false);
        add(spriteText);

        var beesprite:FlxSprite = new FlxSprite(225, 400);
        beesprite.loadGraphic(AssetPaths.bee__png, false, 10, 20);
        add(beesprite);
        var beeText:FlxText = new FlxText(225, 450, 0, "Bee", 12, false);
        add(beeText);

        var honeysprite:FlxSprite = new FlxSprite(300, 400);
        honeysprite.loadGraphic(AssetPaths.honeycomb__png, false, 10, 20);
        add(honeysprite);
        var honeyText:FlxText = new FlxText(300, 450, 0, "Honey", 12, false);
        add(honeyText);

        var flowersprite:FlxSprite = new FlxSprite(400, 400);
        flowersprite.loadGraphic(AssetPaths.flower__png, false, 10, 20);
        add(flowersprite);
        var flowerText:FlxText = new FlxText(400, 450, 0, "Flower", 12, false);
        add(flowerText);

        var back:FlxButton = new FlxButton(500, 425, "Got it!", MenuState);
        add(back);
    }
    
    function MenuState():Void
    {
        FlxG.switchState(new MenuState());
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