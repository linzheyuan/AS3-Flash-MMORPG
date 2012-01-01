package flashmmorpg.events 
{
	import flash.events.Event;
	import flashmmorpg.quests.Task;
	
	/**
	 * ...
	 * @author Knut
	 */
	public class TaskEvent extends Event 
	{
		
		public var task:Task;
		public function TaskEvent(type:String, task:Task, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.task = task;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new TaskEvent(type, task, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("TaskEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}