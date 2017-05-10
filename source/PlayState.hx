package;

import flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.math.FlxRect;
import flixel.util.FlxColor;
import flixel.util.FlxCollision;

class PlayState extends FlxState
{
	private var player:Player; // The player-controlled beekeeper
	private var honey:Hive; // The target
	private var hive:FlxSprite; // The hive design around the honeycomb target
	private var text:FlxText; // The winning text object that is displayed on the screen
	private var bee:Bee; // The enemy object
	private var done:Bool;
	public static var width:Int;
	public static var height:Int;

	/**
	 *  The use of the target X and Y variables allow the position of the honeycomb
	 *  and the surrounding hive to be changed
	 */
	private var dist:Int;
	public static var hiveSize:Int;
	public var beeHive:FlxTypedGroup<Bee>;
    public var rand:FlxRandom = new FlxRandom();
	public static var targetX:Int;
	public static var targetY:Int;
	private var boundary:FlxSprite;
	public static var worldBounds:FlxGroup;
	/**
	 *  Creates the starting board with the honeycomb target, hive graphic, and player
	 *  
	 */
	override public function create():Void
	{
		super.create();
		width = FlxG.width;
		height = FlxG.height;

		// var boundary = new FlxSprite();
		// boundary.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		// var lineStyle:LineStyle = { thickness: 8, color: FlxColor.YELLOW };
		// FlxSpriteUtil.drawRect(boundary, 0, 0, FlxG.width, FlxG.height, FlxColor.TRANSPARENT, lineStyle);
		// boundary.solid = boundary.immovable = true;
		// add(boundary);

		// FlxG.worldBounds.set(FlxG.width, FlxG.height);

		// var worldBounds = FlxCollision.createCameraWall(FlxG.camera, false, 2, false);
		// add(worldBounds);

		beeHive = new FlxTypedGroup<Bee>();

		honey = new Hive();
		add(honey);

		hive = new FlxSprite(targetX - 83, targetY - 38);
		hive.loadGraphic(AssetPaths.hive__png, false, 10, 20);
		add(hive);

		for (i in 0...hiveSize)
		{
			bee = new Bee(targetX + (rand.int(-5, 5)*20), targetY + (rand.int(-1, 5)*20));
			trace("Bee" + i + " x " + bee.x + " y " + bee.y);
			add(bee);
			beeHive.add(bee);
		}

		player = new Player(300, 400);
		// FlxSpriteUtil.bound(player, 0, FlxG.width, 0, FlxG.height);
		add(player);
	}
	
	/**
	 *  On end game conditions, the corresponding text is displayed on the screen.
	 *  The game is reset after 3 seconds.
	 * 
	 */
	public function endGame(player, obj):Void
	{
		done = true;
		if (Type.getClassName(Type.getClass(obj)) == "Hive")
		{
			text = new FlxText(0, 0, 200, "You won!", 18, true);
		}
        else
		{
			text = new FlxText(0, 0, 200, "You were stung!", 18, true);
		}
		text.screenCenter();
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
		if (done) {
			return;
		}

		// FlxG.collide(worldBounds, player);
		// FlxG.collide(worldBounds, beeHive);

		FlxG.overlap(player, honey, endGame);

		for (i in 0...beeHive.length) 
        {
			FlxG.overlap(player, beeHive.members[i], endGame);
            dist = FlxMath.distanceBetween(player, beeHive.members[i]);
            if (dist < 75)
			{
				bee.beeDive(elapsed, player, beeHive.members[i]);
			}
			else
			{
				bee.beeBuzz(elapsed, beeHive.members[i]);
			}
        }

		super.update(elapsed);
	}
}
