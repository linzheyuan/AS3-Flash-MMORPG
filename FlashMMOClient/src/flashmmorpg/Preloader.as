package flashmmorpg
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Knut
	 */
	public class Preloader extends MovieClip 
	{
		
		private var prog:Sprite = new Sprite();
		private var text:TextField = new TextField();
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
				stage.showDefaultContextMenu = false;
			}
			text.text = "0% loaded";
			text.selectable = false;
			text.x = (stage.stageWidth / 2) - (text.width / 2);
			text.y = stage.stageHeight / 2;
			
			prog.graphics.lineStyle(2, 0x000000, 100);
			prog.graphics.drawRect((stage.stageWidth / 2) - 150, (stage.stageHeight / 2) - 25, 300, 25);
			
			addChild(prog);
			addChild(text);
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
		}
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void 
		{
			prog.graphics.beginFill(0x000000, 100);
			prog.graphics.drawRect((stage.stageWidth / 2) - 150, (stage.stageHeight / 2) - 25, 3 * ((e.bytesLoaded / e.bytesTotal) * 100), 25);
			prog.graphics.endFill();
			text.text = e.bytesLoaded / e.bytesTotal * 100 + "% loaded";
			text.x = (stage.stageWidth / 2) - (text.width / 2);
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void 
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			removeChild(prog);
			removeChild(text);
			
			startup();
		}
		
		private function startup():void 
		{
			var mainClass:Class = getDefinitionByName("flashmmorpg.Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}
		
	}
	
}