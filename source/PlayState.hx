package;

import data.EnemyJson;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxTimer;
import haxe.Json;

class PlayState extends FlxState
{
	public static var ENEMY:String = 'temp';

	public var ENEMY_JSON:EnemyJson;
	public var ENEMY_SPRITE:FlxSprite = new FlxSprite();
	public var ENEMY_TIMER:FlxTimer;

	override public function create()
	{
		ENEMY_JSON = Json.parse(FileManager.readFile(FileManager.getDataFile('enemies/$ENEMY.json')));
		ENEMY_SPRITE.loadGraphic(FileManager.getImageFile('enemies/$ENEMY/${ENEMY_JSON.assets[ENEMY_JSON.behavior[0].array_index].file}'));
		ENEMY_SPRITE.screenCenter();
		add(ENEMY_SPRITE);

		ENEMY_TIMER = new FlxTimer(new FlxTimerManager());

		ENEMY_TIMER.start(FlxG.random.float(1, 2), _timer ->
		{
			enemyTime();
		});

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
	function enemyTime()
	{
		for (behavior in ENEMY_JSON.behavior)
		{
			if (FlxG.random.bool(behavior.chance))
			{
				ENEMY_SPRITE.loadGraphic(FileManager.getImageFile('enemies/$ENEMY/${ENEMY_JSON.assets[behavior.array_index].file}'));
				trace(behavior.name);
				break;
			}
		}

		ENEMY_TIMER.start(FlxG.random.float(1, 2), _timer ->
		{
			enemyTime();
		});
	}
}
