package flashmmorpg.events 
{
	import flash.events.Event;
	import flashmmorpg.ui.Element;
	
	/**
	 * ...
	 * @author Knut
	 */
	public class UIEvent extends Event 
	{
		public static const ELEMENT_CLICKED:String = "ELEMENT_CLICKED";
		public static const ELEMENT_DRAGGED:String = "ELEMENT_DRAGGED";
		
		public var element:Element;
		public function UIEvent(type:String, element:Element, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.element = element;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new UIEvent(type, element, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("UIEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}