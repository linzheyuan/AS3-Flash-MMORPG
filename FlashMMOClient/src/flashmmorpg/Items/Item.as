package flashmmorpg.items 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flashmmorpg.events.ItemEvent;
	/**
	 * ...
	 * @author Knut
	 */
	public class Item extends Sprite
	{
		public var Type:int;
		public var Name:String;
		public var Description:String;
		public var Price:int;
		public function Item(Texture:Bitmap, Type:int,Name:String, Description:String, Price:int) 
		{
			this.Type = Type;
			addChild(Texture);
		}
		public function Use():void
		{
			dispatchEvent(new ItemEvent(ItemEvent.ITEM_USE, this));
		}
		public override function toString():String
		{
			return "'" + ItemType.toString(Type) + "' " + Name + " '" + Description + "' costs " + Price;
		}

		
	}

}