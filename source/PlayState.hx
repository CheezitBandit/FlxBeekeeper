package;

import flixel.FlxState;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;

class PlayState extends FlxState
{
	private var player:Player;
	private var honey:Hive;
	private var text:FlxText;

	override public function create():Void
	{
		super.create();

		honey = new Hive(300, 50);
		add(honey);

		player = new Player(300, 400);
		add(player);
	}

	public function win(player, honey):Void
	{
        text = new FlxText(50, 50, 200, "You won!", 18, true);
		add(text);
		haxe.Timer.delay(function()
		{
			FlxG.resetGame();
		}, 3000);
    }

	override public function update(elapsed:Float):Void
	{
		FlxG.overlap(player, honey, win);

		super.update(elapsed);
	}
}
