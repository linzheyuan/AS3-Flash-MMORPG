package flashmmorpg.ui 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Knut
	 */
	public class Box extends Sprite
	{
		private var elements:Array;
		private var blockInput:Boolean;
		public function Box(point:Point, height:int, width:int, blockInput = false) 
		{
			x = point.x;
			y = point.y;
			z = 0;
			height = height;
			width = width;
			this.blockInput = blockInput;
			addEventListener(Event.ADDED_TO_STAGE, stageAddHandler);
		}
		private function stageAddHandler(e:Event):void
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, clickedBox);
		}
		private function clickedBox(me:MouseEvent):void
		{
			if (!me.buttonDown) return;
			for (var i:int = 0; i < elements.length - 1; i++) {
				var curr:Element = elements[i] as Element;
				if ((me.stageX >= curr.point.x && me.stageX <= (curr.point.x + curr.width)) && ((me.stageY >= curr.point.y && me.stageY <= (curr.point.y + curr.height)))) {
					curr.Interact();
					return;
				}
			}
		}
		public function add(e:Element):void
		{
			elements.push(e);
		}
		
	}

}