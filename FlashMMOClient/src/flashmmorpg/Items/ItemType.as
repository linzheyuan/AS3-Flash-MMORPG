package flashmmorpg.items 
{
	import flashmmorpg.assets.Assets;
	import flashmmorpg.sprites.SpriteSheet;
	/**
	 * ...
	 * @author Knut
	 */
	public class ItemType 
	{
		public static const RightHand:int = 0;
		public static const LeftHand:int = 1;
		public static const Chest:int = 2;
		public static const Head:int = 3;
		public static const Necklace:int = 4;
		public static const Legs:int = 5;
		public static const Feet:int = 6;
		public static const Ring:int = 7;
		public static const Bracers:int = 8;
		
		public static const Food:int = 9;
		public static const Potion:int = 10;
		public static const Misc:int = 11;
		public static const Quest:int = 12;
		public static const Crafting:int = 13;
		
		public static function toString(item:int):String
		{
			switch(item)
			{
					case 0: return "RightHand";
					case 1: return "LeftHand";
					case 2: return "Chest";
					case 3: return "Head";
					case 4: return "Necklance";
					case 5: return "Legs";
					case 6: return "Feet";
					case 7: return "Ring";
					case 8: return "Bracers";
					case 9: return "Food";
					case 10: return "Potion";
					case 11: return "Misc";
					case 12: return "Quest";
					case 13: return "Crafting";
					default: return "NaN";
			}
		}
		
	}

}