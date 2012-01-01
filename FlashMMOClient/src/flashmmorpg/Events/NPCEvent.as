package flashmmorpg.events 
{
	import flash.events.Event;
	import flashmmorpg.npcs.NPC;
	/**
	 * ...
	 * @author Knut
	 */
	public class NPCEvent extends Event
	{
		public static const NPC_DEATH:String = "NPC_DEATH";
		public static const NPC_ATTACK:String = "NPC_ATTACK";
		public static const NPC_INTERACT:String = "NPC_INTERACT";
		
		public var npc:NPC;
		public var from:NPC;
		public function NPCEvent(type:String, npc:NPC, from:NPC, bubbles:Boolean, cancelable:Boolean) 
		{
			this.npc = npc;
			this.from = from;
			super(type, bubbles, cancelable);
		}
		public override function clone():Event
		{
			return new NPCEvent(type, npc, from, bubbles, cancelable);
		}
		override public function toString():String 
		{
			return formatToString("NPCEvent", type, npc, from, bubbles, cancelable);
		}
		
	}

}