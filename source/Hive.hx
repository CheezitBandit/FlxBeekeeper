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
    public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);

        makeGraphic(10, 20, FlxColor.YELLOW);
    }


    public override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

 }
