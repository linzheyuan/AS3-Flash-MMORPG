package flashmmorpg.quests 
{
	import flashmmorpg.skills.Skill;
	import flashmmorpg.World;
	/**
	 * ...
	 * @author Knut
	 */
	public class Quest 
	{
		public var Name:String;
		public var Description:String;
		public var Tasks:Array;
		public var reward:Reward;
		public function Quest(Name:String, Description:String, Tasks:Array, reward:Reward) 
		{
		this.Name = Name;
		this.Description = Description;
		this.Tasks = Tasks;
		this.reward = reward;
		}
		public function Progress():void
		{
			Tasks.shift();
			if (Tasks.length == 0) Finish();
		}
		private function Finish():void
		{
			World.MainPlayer.addReward(reward);
		}
		public function FinishTask():void
		{
			Progress();
		}
		
	}

}