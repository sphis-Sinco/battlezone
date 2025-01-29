package;

import data.EnemyJson;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Json;

class PlayState extends FlxState
{
	public static var ENEMY:String = 'temp';

	public var ENEMY_JSON:EnemyJson;
	public var ENEMY_SPRITE:FlxSprite = new FlxSprite();

	override public function create()
	{
		ENEMY_JSON = Json.parse(FileManager.readFile(FileManager.getDataFile('enemies/$ENEMY.json')));
		ENEMY_SPRITE.loadGraphic(FileManager.getImageFile('enemies/$ENEMY/${ENEMY_JSON.assets[ENEMY_JSON.behavior[0].array_index].file}'));

		ENEMY_SPRITE.screenCenter();
		add(ENEMY_SPRITE);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
