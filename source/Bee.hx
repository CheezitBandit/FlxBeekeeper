package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxRandom;
import flixel.math.FlxMath;
import flixel.group.FlxGroup;

/**
 *  @author Jess Geiger
 */
 class Bee extends FlxSprite
 {

    private var newX:Int;
    private var newY:Int;
    private var dist:Int;
    public var rand:FlxRandom = new FlxRandom();
    private var difX:Float;
    private var difY:Float;

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

    public function beeBuzz(elapsed, bee:Bee):Void
    {
        newX = rand.int(-3, 3);
        newY = rand.int(-3, 3);

        bee.x += newX;
        bee.y += newY;
        // Ensure bee is within bounds of window
        if (bee.x > 1200 || bee.x < 0)
        {
            bee.x -= newX;
        }
        if (bee.y > 800 || bee.y < 0)
        {
            bee.y -= newY;
        }
    }


    public function beeDive(elapsed:Float, player:Player, bee:Bee):Void
    {
        trace("So close!");

        difX = player.x - bee.x;
        difY = player.y - bee.y;

        if (difX > 0) //If player is below the bee
        {
            newX = rand.int(0, 3);
        }
        else if (difY < 0) //If bee is below the player
        {
            newX = rand.int(-3, 0);
        }
        else //If bee and player are on the same X position
        {
            newX = rand.int(-3, 3);
        }

        if (difY > 0) //If player is to the right of the bee
        {
            newY = rand.int(0, 3);
        }
        else if (difY < 0) //If player is to the left of the bee
        {
            newY = rand.int(-3, 0);
        }
        else //If bee and player are on the same Y position
        {
            newY = rand.int(-3, 3);
        }

        bee.x += newX;
        bee.y += newY;
        // Ensure bee is within bounds of window
        if (bee.x > 1500 || bee.x < 0)
        {
            bee.x -= newX;
        }
        if (bee.y > 1000 || bee.y < 0)
        {
            bee.y -= newY;
        }
    }

    public override function update(elapsed):Void
    {
        super.update(elapsed);
    }

 }