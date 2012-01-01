package flashmmorpg.utils 
{
		import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	/**
	 * ...
	 * @author Knut
	 */

	dynamic public class KeyUtils extends Proxy {
		
		private static var stage:Stage;
		private static var keysDown:Object;
		
		public function KeyUtils(stage:Stage) {
			construct(stage);
		}
		
		public function construct(stage:Stage):void {
			KeyUtils.stage = stage;
			keysDown = new Object();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
		}
		
		flash_proxy override function getProperty(name:*):* {
			return (name in Keyboard) ? Keyboard[name] : -1;
		}
		
		public function isDown(keyCode:uint):Boolean {
			return Boolean(keyCode in keysDown);
		}
		
		public function dispose():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyReleased);
			keysDown = new Object();
			KeyUtils.stage = null;
		}
		
		private function keyPressed(evt:KeyboardEvent):void {
			keysDown[evt.keyCode] = true;
		}
		
		private function keyReleased(evt:KeyboardEvent):void {
			delete keysDown[evt.keyCode];
		}
	}

}