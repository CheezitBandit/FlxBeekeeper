package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;

/**
 *  @author Jess Geiger
 */
 class Player extends FlxSprite
 {
    private var speed:Int = 1;
    public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);

        makeGraphic(20, 20, FlxColor.WHITE);
    }

    /**
     *  Updates beekeeper movement based on player input
     *  
     *  @param speed determines if the player is walking or running
     */
    public function movePlayer():Void
    {
        if (FlxG.keys.anyPressed([FlxKey.SHIFT]))
        {
            speed = 2;
        }
        else
        {
            speed = 1;
        }

        if (FlxG.keys.anyPressed([FlxKey.LEFT]))
        {
            x = x - speed;
        }
        else if (FlxG.keys.anyPressed([FlxKey.RIGHT]))
        {
            x = x + speed;
        }
        if (FlxG.keys.anyPressed([FlxKey.UP]))
        {
            y = y - speed;
        }
        else if (FlxG.keys.anyPressed([FlxKey.DOWN]))
        {
            y = y + speed;
        }
    }

    public override function update(elapsed:Float):Void
    {
        movePlayer();
        super.update(elapsed);
    }

 }
