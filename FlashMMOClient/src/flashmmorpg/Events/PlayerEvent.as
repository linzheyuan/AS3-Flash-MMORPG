package flashmmorpg.events 
{
	import flash.events.Event;
	import flashmmorpg.npcs.Player;
	/**
	 * ...
	 * @author Knut
	 */
	public class PlayerEvent extends Event
	{
		public static const PLAYER_MOVE:String = "PLAYER_MOVE";
		public static const PLAYER_ATTACK:String = "PLAYER_ATTACK";
		public static const PLAYER_USESKILL:String = "PLAYER_USESKILL";
		public static const PLAYER_DEATH:String = "PLAYER_DEATH";
		
		public var player:Player
		public function PlayerEvent(type:String, player:Player, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			this.player = player;
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new PlayerEvent(type, player, bubbles, cancelable);
		}
		override public function toString():String 
		{
			return formatToString("PlayerEvent", type, player, bubbles, cancelable);
		}
	}

}