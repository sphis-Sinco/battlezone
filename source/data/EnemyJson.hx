package data;

typedef EnemyJson =
{
	var name:String;
	var assets:Array<EnemyAssetJson>;
	var behavior:Array<EnemyBehaviorJson>;
}

typedef EnemyAssetJson =
{
	var asset:String;
	var file:String;
}

typedef EnemyBehaviorJson =
{
	var name:String;
	var chance:Float;
}