package flashmmorpg.quests.questline.tutorial.getacquainted 
{
	import flashmmorpg.events.NPCEvent;
	import flashmmorpg.npcs.friendlies.TutorialMaster;
	import flashmmorpg.npcs.NPC;
	import flashmmorpg.quests.Quest;
	import flashmmorpg.quests.Task;
	/**
	 * ...
	 * @author Knut
	 */
	public class TalkToWoman extends Task
	{
		
		public function TalkToWoman(quest:Quest) 
		{
			super("Talk to the woman", "Talk to the woman you were instructed to", quest);
		}
		override public function NPCInteracted(nde:NPCEvent):void 
		{
			super.NPCInteracted(nde);
			if (nde.npc.ID == TutorialMaster.ID) {
				
			}
		}
		
	}

}