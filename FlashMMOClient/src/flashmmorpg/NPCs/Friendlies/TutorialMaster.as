package flashmmorpg.npcs.friendlies 
{
	import flashmmorpg.npcs.NPC;
	/**
	 * ...
	 * @author Knut
	 */
	public class TutorialMaster extends NPC
	{
		public static const ID:int = 0;
		public function TutorialMaster() 
		{
			super(ID, null, 10, 10, null, NPC.DIRECTION_DOWN, true);
		}
		
	}

}