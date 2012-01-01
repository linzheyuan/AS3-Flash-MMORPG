package flashmmorpg.npcs 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flashmmorpg.items.Armor;
	import flashmmorpg.items.Item;
	import flashmmorpg.skills.Skill;
	import flashmmorpg.assets.Assets;
	import flashmmorpg.sprites.SpriteSheet;
	/**
	 * ...
	 * @author Knut
	 */
	public class NPC extends Sprite
	{
		public static const DIRECTION_UP:int = 0;
		public static const DIRECTION_RIGHT:int = 1;
		public static const DIRECTION_DOWN:int = 2;
		public static const DIRECTION_LEFT:int = 3;
		public var Health:int;
		public var Mana:int;
		
		public var Skills:Array;
		public var isEssential:Boolean;
		
		public var Direction:int;
		public var ID:int;
		public var mapID:int;
		private var Equipment:Array;
		public function NPC(id:int, mapID:int, Texture:Bitmap, Health:int, Mana:int, Skills:Array, Equipment:Array, Direction:int, isEssential:Boolean = false) 
		{
			this.mapID = mapID;
			this.Equipment = Equipment;
			ID = id;
			this.Health = Health;
			this.Mana = Mana;
			this.Skills = Skills;
			this.isEssential = isEssential;
			addChild(Texture);
		}
		public function destroy():void
		{
			Skills = null;
			Equipment = null;
			parent.removeChild(this);
		}
		public function takeHit(damage:int):int 
		{
		  var armor:int = getArmor();
		  if (armor > damage) return 0;
		  damage -= armor;
		  Health -= damage;
		  
		  if (Health < 1) onDeath();
		  return 0;
		}
		public function getArmor():int
		{
			var armor:int = 0;
			for (var i:int = 0; i < Equipment.length -1; i++) {
				armor += (Equipment[i] as Armor).ArmorValue;
			}
			return armor;
		}
		public function onDeath():void 
		{
			parent.removeChild(this);
		}
		public function move(e:KeyboardEvent, step:int):void {
			trace("Key pressed ", e.keyCode, " step ", step);
			switch(e.keyCode) {
				case 37: //left
					removeChildAt(0);
					switch(step) {
					case 0: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(4), 0);
					break;
					case 1: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(3), 0);
					break;
					case 2: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(5), 0);
					break;
					}
					break;
				case 38: //up
					removeChildAt(0);
					switch(step) {
					case 0: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(10), 0);
					break;
					case 1: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(9), 0);
					break;
					case 2: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(11), 0);
					break;
					}
					break;
				case 39: //right
					removeChildAt(0);
					switch(step) {
					case 0: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(7), 0);
					break;
					case 1: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(6), 0);
					break;
					case 2: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(8), 0);
					break;
					}
					break;
				case 40: //down
					removeChildAt(0);
					switch(step) {
					case 0: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(1), 0);
					break;
					case 1: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(0), 0);
					break;
					case 2: addChildAt(new SpriteSheet(new Assets.Character1(), 32, 32).getTile(2), 0);
					break;
					}
					break;
			}
			
		}
		
	}

}