package flashmmorpg.sprites 
{
	
	import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Rectangle;
	import flashmmorpg.assets.Assets;
	
	/**
	 * ...
	 * @author Knut
	 */
	
    public class SpriteSheet extends Sprite
	{
		public static const ItemSpriteSheet:SpriteSheet = new SpriteSheet(new Assets.Items(), 32, 32);
		//public static const TileSpriteSheet:SpriteSheet = new SpriteSheet(new Assets.Tiles(), 32, 32);
		
		
        private var tileSheetBitmapData:BitmapData;

        private var tileWidth:int;
        private var tileHeight:int;
        private var rowLength:int;

        private var tileRectangle:Rectangle;
        private var tilePoint:Point;

        public function SpriteSheet(tileSheetBitmap:Bitmap, width:Number = 16, height:Number = 16)
        {
            tileSheetBitmapData = tileSheetBitmap.bitmapData;
            tileWidth = width;
            tileHeight = height;

            rowLength = int(tileSheetBitmap.width / width);

            tileRectangle = new Rectangle(0, 0, tileWidth, tileHeight);
            tilePoint = new Point(0, 0);
			
        }

        public function getTile(tileNumber:int):Bitmap
        {
            tileRectangle.x = int((tileNumber % rowLength)) * tileWidth;
            tileRectangle.y = int((tileNumber / rowLength)) * tileHeight;
			var data:BitmapData = new BitmapData(tileWidth, tileHeight, true);
			data.copyPixels(tileSheetBitmapData, tileRectangle, tilePoint);
            //canvasBitmapData.copyPixels(tileSheetBitmapData, tileRectangle, tilePoint);
			return new Bitmap(data);
        }

    }

}