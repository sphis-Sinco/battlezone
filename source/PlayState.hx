package;

import data.EnemyJson;
import flixel.FlxState;
import haxe.Json;

class PlayState extends FlxState
{
	public static var ENEMY:String = 'temp';

	public var ENEMY_JSON:EnemyJson;

	override public function create()
	{
		ENEMY_JSON = Json.parse(FileManager.readFile(FileManager.getDataFile('enemies/$ENEMY.json')));
		trace(ENEMY_JSON);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
