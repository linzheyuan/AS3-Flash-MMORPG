package flashmmorpg.quests 
{
	import flashmmorpg.items.Item;
	/**
	 * ...
	 * @author Knut
	 */
	public class Reward 
	{
		public var Experience:int;
		public var Money:int;
		public var Items:Array;
		public function Reward(Experience:int, Money:int, Items:Array) 
		{
			this.Experience = Experience;
			this.Money = Money;
			this.Items = Items;
		}
		
	}

}