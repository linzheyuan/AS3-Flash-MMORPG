package flashmmorpg.items.food 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flashmmorpg.items.ItemType;
	import flashmmorpg.items.Item;
	/**
	 * ...
	 * @author Knut
	 */
	public class Food extends Item
	{
		
		public function Food(Texture:Bitmap, Name:String, Description:String, Price:int)
		{
			super(Texture, ItemType.Food, Name, Description, Price);
		}
		
	}

}