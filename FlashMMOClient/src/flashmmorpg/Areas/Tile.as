package flashmmorpg.areas 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Knut
	 */
	public class Tile extends Sprite
	{
		public var isBlocking:Boolean;
		public function Tile(Texture:Bitmap,isBlocking:Boolean = false) 
		{
			addChild(Texture);
			this.isBlocking = isBlocking;
		}
		
	}

}