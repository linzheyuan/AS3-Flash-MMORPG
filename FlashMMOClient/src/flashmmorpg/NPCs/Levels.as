package flashmmorpg.npcs 
{
	/**
	 * ...
	 * @author Knut
	 */
	public class Levels
	{
		private static const experienceLevels:Array = [0, 65, 150, 312, 500, 768, 1186, 1622, 2340, 3024, 4096, 5688, 7508];
		
		public static function CheckLevel(p:Player):Boolean
		{
			return p.Experience >= experienceLevels[p.Level + 1];
		}
		public static function XPToNextLevel(p:Player):int
		{
			return experienceLevels[p.Level + 1] - p.Experience;
		}
	}

}