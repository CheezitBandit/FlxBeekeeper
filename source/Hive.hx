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
 class Hive extends FlxSprite
 {

    public var rand:FlxRandom = new FlxRandom();
    private var yHeight:Int;
    /**
     *  Create new honeycomb target object at requested parameters
     *  
     *  @param   X is the X position of the object
     *  @param   Y is the Y position of the object
     *  @param   SimpleGraphic is an optional argument which isn't used
     */
    public function new(?X:Int=0, ?Y:Int=0, ?SimpleGraphic:FlxGraphicAsset)
    {
        
        X = rand.int(83, FlxG.width - 83);
        Y = rand.int(38, Std.int(FlxG.height/2) - 38);
        PlayState.targetX = X;
        PlayState.targetY = Y;
        super(X, Y, SimpleGraphic);
        loadGraphic(AssetPaths.honeycomb__png, false, 10, 20);
    }


    public override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

 }
