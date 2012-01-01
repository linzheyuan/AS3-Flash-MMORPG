package flashmmorpg.quests.questline.tutorial.getacquainted
{
	import flashmmorpg.events.PlayerEvent;
	import flashmmorpg.quests.Quest;
	import flashmmorpg.quests.Task;
	import flashmmorpg.World;
	/**
	 * ...
	 * @author Knut
	 */
	public class MoveCharacter extends Task
	{

		public function MoveCharacter(Parent:Quest) 
		{
			super("Move your character", "Move your character atleast 1 square in any direction", Parent);
			World.MainStage.addEventListener(PlayerEvent.PLAYER_MOVE, PlayerInteracted);
		}
		override public function PlayerInteracted(pi:PlayerEvent):void 
		{
			super.PlayerInteracted(pi);
			
			isFinished = true;
			Finish(this);
		}
		
	}

}