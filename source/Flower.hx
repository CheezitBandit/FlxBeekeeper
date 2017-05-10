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

    public static var isPresent:Bool = false;
    public var rand:FlxRandom = new FlxRandom();

    public function new(?X:Float=0, ?Y:Float=0, ?isPresent:Bool, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
        loadGraphic(AssetPaths.flower__png, false, 10, 20);
    }
    
    public static function collectFlower(plyr:Player, flwr:Flower):Void
    {
        isPresent = false;
		trace("Picked up flower");
        flwr.destroy();
    }

    public override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

 }
