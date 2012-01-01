package flashmmorpg 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flashmmorpg.assets.Assets;
	import flashmmorpg.npcs.Player;
	import flashmmorpg.sprites.SpriteSheet;
	/**
	 * ...
	 * @author Knut
	 */
	public class World extends Sprite
	{
		public var player:Player;
		public var worldTiles:Array;
		public static var MainStage:Stage;
		public static var MainPlayer:Player;
		public function init():void
		{
			//player = new Player(new SpriteSheet(new Assets.Characters(), 32, 64).getTile(0), 10, 10, null, 10, 10, 10);
			//addChild(player);
			//player.x = 100;
			//player.y = 100;
			player = new Player(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(0), 10, 10, null, null, 10, 10, 10);
			player.x = 100;
			player.y = 100;
			addChild(player);
		}
		
		
	}

}