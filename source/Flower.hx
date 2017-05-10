package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxRandom;

/**
 *  @author Jess Geiger
 */
 class Flower extends FlxSprite
 {
    private var randX:Int = 0;
    private var randY:Int = 0;

    public var rand:FlxRandom = new FlxRandom();

    public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
        makeGraphic(15, 30, FlxColor.PURPLE);
    }

    public override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

 }
