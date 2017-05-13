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
import flixel.input.keyboard.FlxKey;

class PlayState extends FlxState
{
	private var player:Player; // The player-controlled beekeeper
	private var honey:Hive; // The target
	private var hive:FlxSprite; // The hive design around the honeycomb target
	private var text:FlxText; // The winning text object that is displayed on the screen
	private var bee:Bee; // The enemy object
	private var flower:Flower;
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

	public static var flowerSpawn:Int = 0;
	/**
	 *  Creates the starting board with the honeycomb target, hive graphic, and player
	 *  
	 */
	override public function create():Void
	{
		super.create();
		width = FlxG.width;
		height = FlxG.height;

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
			Flower.isPresent = false;
			return;
		}

        flowerSpawn++;
		// If there is no flower present, the player has no flowers, and enough time has passed,
		// spawn a new flower
        if (!Flower.isPresent && Flower.numberFlowers == 0 && flowerSpawn == 500) {
			flower = new Flower(rand.int(5, FlxG.width - 20), rand.int(5, FlxG.height - 20));
			Flower.isPresent = true;
			FlxG.state.add(flower);
            trace("Flower added");
        }
		// Else if too much time has passed and the player has not collected a flower, destroy it
		else if (Flower.isPresent && Flower.numberFlowers == 0 && flowerSpawn == 1500) {
			flower.destroy(); //Does not work for dropped flower
			flowerSpawn = 0;
		}
		// Else if the player has collected the flower, don't increment the clock
		else if (!Flower.isPresent && Flower.numberFlowers == 1) {
			flowerSpawn = 501;
		}
		// else { //Start the clock again after the player drops the flower
		trace(flowerSpawn);
		// }

		// if (flowerSpawn == 1000) {
		// 	flower times out
		// }

		FlxG.overlap(player, honey, endGame);

		//If flower object exists, check for player collision
		if (Flower.isPresent) {
			FlxG.overlap(player, flower, Flower.collectFlower);
		}
		
		if (FlxG.keys.anyPressed([FlxKey.SPACE]) && Flower.numberFlowers > 0)
        {
            Flower.throwFlower(player);
			trace("Flower: " + flower.x + " " + flower.y);
        }
		

		for (i in 0...beeHive.length) 
        {
			
			FlxG.overlap(player, beeHive.members[i], endGame);
            dist = FlxMath.distanceBetween(player, beeHive.members[i]);
            if (dist < 75)
			{
				bee.beeDive(elapsed, player, beeHive.members[i]);
			}
			else if (Flower.isPresent)
			{
				if (FlxMath.distanceBetween(player, beeHive.members[i]) < 75) //<!--****This hneeds to change back to player when I get arround the invalid field access
				{
					bee.beeDive(elapsed, flower, beeHive.members[i]);
				}
				else {
					bee.beeBuzz(elapsed, beeHive.members[i]);
				}
			}
			else
			{
				bee.beeBuzz(elapsed, beeHive.members[i]);
			}
        }

		super.update(elapsed);
	}
}
