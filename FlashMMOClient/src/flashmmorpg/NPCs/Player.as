package flashmmorpg.npcs 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flashmmorpg.items.Item;
	import flashmmorpg.Main;
	import flashmmorpg.quests.Reward;
	import flashmmorpg.skills.Skill;
	import flashmmorpg.World;
	import flashmmorpg.utils.KeyUtils;
	/**
	 * ...
	 * @author Knut
	 */
	public class Player extends NPC
	{
		public var Experience:int;
		public var Level:int;
		public var Money:int;
		public var Speed:int = 3;
		
		public var Items:Array;
		public var QuestLog:Array;
		
		//private const Keyboard:KeyUtils = new KeyUtils(World.MainStage);
		private var movingStep:int = 0;
		public function Player(Texture:Bitmap, Health:int, Mana:int, Skills:Array, Equipment:Array, Experience:int, Level:int, Money:int) 
		{
			trace("Player");
			addEventListener(Event.ADDED_TO_STAGE, stageAddHandler);
			super(0, 0, Texture, Health, Mana, Skills, Equipment, 0, false);
		}
		private function stageAddHandler(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, movePlayer);
			stage.addEventListener(KeyboardEvent.KEY_UP, stopMoving);
		}
		public function addExperience(Experience:int):void {
			this.Experience += Experience;
			while (Levels.CheckLevel(this)) {
				Level++;
				LevelUp();
			}
		}
		public function addMoney(Money:int):void {
			this.Money += Money;
		}
		public function addItem(item:Item):void {
			Items.push(item);
		}
		public function addReward(reward:Reward):void
		{
			addExperience(reward.Experience);
			addMoney(reward.Money);
			if (reward.Items.length >= 0)
			{
				for (var i:int = 0; i < reward.Items.length; i++) {
					addItem(reward.Items[i]);
				}
			}
		}
		private function LevelUp():void 
		{
			
		}
		private function stopMoving(e:KeyboardEvent):void {
			movingStep = 0;
			move(e, movingStep);
		}
		public function movePlayer(e:KeyboardEvent):void {
			trace("Location: x:" + x + " y:" + y);
			movingStep++;
			if (movingStep > 2) movingStep = 0;
			super.move(e, movingStep);
			switch(e.keyCode) {
				case 37: //left
					x -= Speed;
					break;
				case 38: //up
					y -= Speed;
					break;
				case 39: //right
					x += Speed;
					break;
				case 40: //down
					y += Speed;
					break;
			}
			Main.server.Send("POS///" + x + "///" + y);
		}
		
	}
}