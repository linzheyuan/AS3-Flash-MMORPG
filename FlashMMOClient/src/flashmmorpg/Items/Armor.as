package flashmmorpg.items 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Knut
	 */
	public class Armor extends Item
	{
		public var ArmorValue:int;
		public function Armor(Texture:Bitmap, Type:int, Name:String, Description:String, Price:int, ArmorValue:int) 
		{
			this.ArmorValue = ArmorValue;
			super(Texture, Type, Name, Description, Price);
		}
		
	}

}