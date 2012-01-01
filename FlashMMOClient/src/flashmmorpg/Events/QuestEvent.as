package flashmmorpg.events 
{
	import flash.events.Event;
	import flashmmorpg.quests.Quest;
	
	/**
	 * ...
	 * @author Knut
	 */
	public class QuestEvent extends Event 
	{
		public static const QUEST_STARTED:String = "QUEST_STARTED";
		public static const QUEST_PROGRESS:String = "QUEST_PROGRESS";
		public static const QUEST_FINISHED:String = "QUEST_FINISHED";
		
		public var quest:Quest;
		public function QuestEvent(type:String, quest:Quest, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.quest = quest;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new QuestEvent(type, quest, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("QuestEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}