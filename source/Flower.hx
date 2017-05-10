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

    public var isPresent:Bool;
    public var rand:FlxRandom = new FlxRandom();

    public function new(?X:Float=0, ?Y:Float=0, ?isPresent:Bool, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
        makeGraphic(15, 30, FlxColor.PURPLE);
    }
    
    public function collectFlower(plyr:Player, flwr:Flower):Void
    {
		trace("Picked up flower"); //Doesn't work
    }

    public override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

 }
