package flashmmorpg.sprites 
{
import flash.display.Bitmap;
	import flash.events.Event;
	/**
	 * ...
	 * @author Knut
	 */
	public class SpriteSheetAnimation extends SpriteSheet
	{
		public var frameNumber:int = 0;
		public var numFrames:int = 0;
		public var isAdded:Boolean = false;
		public var destroyWhenComplete:Boolean = false;
		private var anim:Bitmap = new Bitmap();

		public function SpriteSheetAnimation(tileSheetBitmap:Bitmap, Width:Number, Height:Number, numberOfFrames:int , startImmediately:Boolean, destroyOnComplete:Boolean ):void
		{
			super(tileSheetBitmap, Width, Height);

			numFrames = numberOfFrames;
			destroyWhenComplete = destroyOnComplete;
			
			addChild(anim);
			if (startImmediately)
			{
				addEventListener(Event.ENTER_FRAME, animate);
				isAdded = true;
				trace(isAdded);
			}
		}
		public function startAnimation():void
		{
			if (!isAdded)
			{
				addEventListener(Event.ENTER_FRAME, animate);
				isAdded = true;
			}
		}
		public function animate(e:Event):void
		{
				anim = getTile(frameNumber);
trace(frameNumber);
				frameNumber++;
				if (frameNumber == numFrames)
				{
					frameNumber = 0;
					if (destroyWhenComplete)
					{
						destroy();
					}
				}
		}
		public function destroy(e:Event = null):void
		{
			if (parent != null)
			{
				parent.removeChild(this);
				if (!isAdded)
				{
					removeEventListener(Event.ENTER_FRAME, animate);
					parent.removeChild(this);
				}
			}
		}
	}

}