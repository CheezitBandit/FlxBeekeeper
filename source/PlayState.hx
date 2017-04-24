package;

import flixel.FlxState;

class PlayState extends FlxState
{
	private var player:Player;

	override public function create():Void
	{
		super.create();

		player = new Player(300, 400);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
