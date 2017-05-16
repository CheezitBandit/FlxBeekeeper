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

    public static var isPresent:Bool = false; // Whether or not the flower is on the playing field
    public var rand:FlxRandom = new FlxRandom();
    public static var numberFlowers:Int = 0; // Checks if the number of flowers in the player's inventory is 1 or 0
    public static var beenDropped:Bool = false; // Checks if the flower has been dropped yet or is still available for pickup
    public static var flowerText:FlxText; // The text on the screen to show if there is a flower in inventory

    public function new(?X:Float=0, ?Y:Float=0, ?isPresent:Bool, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
        loadGraphic(AssetPaths.flower__png, false, 10, 20);
    }
    /**
     *  Causes the player to "pick up" the flower when colliding
     *  
     *  @param   plyr is the player which is colliding with the flower
     *  @param   flwr is the flower which is being collected
     */
    public static function collectFlower(plyr:Player, flwr:Flower):Void
    {
        Flower.numberFlowers = 1;
        PlayState.flowerSpawn = 0;
        Flower.isPresent = false;
        flwr.destroy();
        flowerText = new FlxText(PlayState.width - 200, PlayState.height - 100, 0, "Flower: 1", 12, true);
        FlxG.state.add(flowerText);
    }
    /**
     *  Places the flower back on the screen when the player hits the space bar
     *  
     */
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
