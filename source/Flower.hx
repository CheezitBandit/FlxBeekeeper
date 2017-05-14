package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
import flixel.text.FlxText;

/**
 *  @author Jess Geiger
 */
 class Flower extends FlxSprite
 {

    public static var isPresent:Bool = false;
    public var rand:FlxRandom = new FlxRandom();
    public var count:Int;
    public static var numberFlowers:Int = 0;
    public static var beenDropped:Bool = false;
    public static var flowerText:FlxText;

    public function new(?X:Float=0, ?Y:Float=0, ?isPresent:Bool, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
        loadGraphic(AssetPaths.flower__png, false, 10, 20);
    }
    
    public static function collectFlower(plyr:Player, flwr:Flower):Void
    {
        Flower.numberFlowers = 1;
        PlayState.flowerSpawn = 0;
        Flower.isPresent = false;
        flwr.destroy();
        flowerText = new FlxText(PlayState.width - 200, PlayState.height - 100, 0, "Flower: 1", 12, true);
        FlxG.state.add(flowerText);
    }

    public static function throwFlower(plyr:Player):Void
    {
        Flower.numberFlowers = 0;
        Flower.isPresent = true;
        Flower.beenDropped = true;
        flowerText.destroy();
    }

    public override function update(elapsed:Float):Void
    {

        super.update(elapsed);
    }

 }
