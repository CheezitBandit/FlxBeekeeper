package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;

/**
 *  @author Jess Geiger
 */
 class Hive extends FlxSprite
 {

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
        loadGraphic(AssetPaths.honeycomb__png, false, 10, 20);
    }


    public override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

 }
