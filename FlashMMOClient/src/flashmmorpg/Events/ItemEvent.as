package flashmmorpg.events 
{
	import flash.events.Event;
	import flashmmorpg.items.Item;
	/**
	 * ...
	 * @author Knut
	 */
	public class ItemEvent extends Event
	{
		public static const ITEM_PICKEDUP:String = "ITEM_PICKEDUP";
		public static const ITEM_USE:String = "ITEM_USE";
		public static const ITEM_DROP:String = "ITEM_DROP";
		
		public var item:Item;
		public function ItemEvent(type:String, item:Item, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			this.item = item;
			super(type, bubbles, cancelable);
		}
		public override function clone():Event
		{
			return new ItemEvent(type, item, bubbles, cancelable);
		}
		override public function toString():String 
		{
			return formatToString("ItemEvent", type, item, bubbles, cancelable);
		}
		
	}

}