package flashmmorpg.ui 
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Knut
	 */
	public class Element 
	{
		
		public var point:Point;
		public var Texture:Bitmap;
		public var height:int;
		public var width:int;
		
		public function Element(point:Point, Texture:Bitmap, height:int, width:int) 
		{
			this.point = point;
			this.Texture = Texture;
			this.height = height;
			this.width = width;
		}
		public function Interact():void{}
		
	}

}