package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxRandom;

/**
 *  @author Jess Geiger
 */
 class Bee extends FlxSprite
 {

    private var newX:Int;
    private var newY:Int;
    public var rand:FlxRandom = new FlxRandom();

    /**
     *  Create new honeycomb target object at requested parameters
     *  
     *  @param   X is the X position of the object
     *  @param   Y is the Y position of the object
     *  @param   SimpleGraphic is an optional argument which isn't used
     */
    public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
        loadGraphic(AssetPaths.bee__png, false, 10, 20);
    }

    public function beeBuzz(elapsed):Void
    {
        newX = rand.int(-3, 3);
        newY = rand.int(-3, 3);

        x += newX;
        y += newY;
        // Ensure bee is within bounds of window
        if (x > 1000 || x < 0)
        {
            x -= newX;
        }
        if (y > 800 || y < 0)
        {
            y -= newY;
        }


    }


    public override function update(elapsed:Float):Void
    {
        beeBuzz(elapsed);
        super.update(elapsed);
    }

 }