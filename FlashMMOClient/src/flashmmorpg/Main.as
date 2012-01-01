package flashmmorpg
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flashmmorpg.assets.Assets;
	import flashmmorpg.items.food.Tomato;
	import flashmmorpg.npcs.Player;
	import flashmmorpg.sprites.SpriteSheet;
	import flashmmorpg.sprites.SpriteSheetAnimation;
	import flashmmorpg.utils.Debugger;
	import org.flixel.FlxGame;
	import flashmmorpg.states.MainMenu;

	/**
	 * ...
	 * @author Knut
	 */
	[Frame(factoryClass="flashmmorpg.Preloader")]
	public class Main extends Sprite 
	{
	public static const GameObject:FlxGame = new FlxGame(640, 480, MainMenu, 1, 60, 15, false);
	public static const server:Server = new Server();
	public static const world:World = new World();
	
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(GameObject);
			GameObject.forceDebugger = true;
			server.Connect();
			World.MainStage = stage;
			world.init();
			addChild(world);
			addChild(new Debugger());
		}

	}

}