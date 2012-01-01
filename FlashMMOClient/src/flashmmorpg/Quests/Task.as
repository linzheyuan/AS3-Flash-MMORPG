package flashmmorpg.quests 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flashmmorpg.events.PlayerEvent;
	import flashmmorpg.events.UIEvent;
	import flashmmorpg.npcs.Player;
	import flashmmorpg.events.ItemEvent;
	import flashmmorpg.events.NPCEvent;
	import flashmmorpg.World;
	/**
	 * ...
	 * @author Knut
	 */
	public class Task 
	{
		public var Name:String;
		public var Description:String;
		public var Parent:Quest;
		public var isFinished:Boolean = false;
		public function Task(Name:String, Description:String, Parent:Quest ) 
		{
			this.Name = Name;
			this.Description = Description;
			this.Parent = Parent;
		}
		public function ItemInteracted(ipe:Event):void { if (isFinished) return; }
		public function NPCInteracted(nde:NPCEvent):void { if (isFinished) return; }
		public function UIInteracted(uii:UIEvent):void { if (isFinished) return; }
		public function PlayerInteracted(pi:PlayerEvent):void { if (isFinished) return; }
		public function Finish(t:Task):void { Parent.FinishTask() };
	}

}