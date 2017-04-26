package;

import flixel.FlxState;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

class PlayState extends FlxState
{
	private var player:Player; // The player-controlled beekeeper
	private var honey:Hive; // The target
	private var hive:FlxSprite; // The hive design around the honeycomb target
	private var text:FlxText; // The winning text object that is displayed on the screen
	/**
	 *  The use of the target X and Y variables allow the position of the honeycomb
	 *  and the surrounding hive to be changed
	 */
	private var targetX:Int = 300;
	private var targetY:Int = 50;

	/**
	 *  Creates the starting board with the honeycomb target, hive graphic, and player
	 *  
	 */
	override public function create():Void
	{
		super.create();

		honey = new Hive(targetX, targetY);
		add(honey);

		hive = new FlxSprite(targetX - 83, targetY - 38);
		hive.loadGraphic(AssetPaths.hive__png, false, 10, 20);
		add(hive);

		player = new Player(300, 400);
		add(player);
	}
	
	/**
	 *  On winning conditions, the text is displayed on the screen. The game is reset after 3 seconds.
	 * 
	 */
	public function win(player, honey):Void
	{
        text = new FlxText(50, 50, 200, "You won!", 18, true);
		add(text);
		haxe.Timer.delay(function()
		{
			FlxG.resetGame();
		}, 3000);
    }

	/**
	 *  Update map based on changes made during the last cycle
	 *  
	 *  @param   elapsed is the time elapsed since the last update
	 */
	override public function update(elapsed:Float):Void
	{
		FlxG.overlap(player, honey, win);

		super.update(elapsed);
	}
}
