package flashmmorpg.quests.questline.tutorial 
{
	import flashmmorpg.quests.Quest;
	import flashmmorpg.quests.questline.tutorial.getacquainted.MoveCharacter;
	import flashmmorpg.quests.questline.tutorial.getacquainted.TalkToWoman;
	import flashmmorpg.quests.Reward;
	import flashmmorpg.quests.Task;
	/**
	 * ...
	 * @author Knut
	 */
	public class GetAcquainted extends Quest
	{
	
		public function GetAcquainted() 
		{
			reward = new Reward(10, 10, null);
			Tasks = [new MoveCharacter(this), new TalkToWoman(this)];
			super("Getting Acquainted", "Learn how to control you character and familiarize yourself with the User Interface", Tasks, reward);
		}
		
	}

}