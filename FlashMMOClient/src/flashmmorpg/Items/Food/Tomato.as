package flashmmorpg.items.food 
{
	import flashmmorpg.assets.Assets;
	import flashmmorpg.items.Item;
	import flashmmorpg.items.ItemType;
	import flashmmorpg.sprites.SpriteSheet;
	/**
	 * ...
	 * @author Knut
	 */
	public class Tomato extends Food
	{
		
		public function Tomato()
		{
			super(SpriteSheet.ItemSpriteSheet.getTile(4), "Tomato", "A ripe, red tomato", 4 );
		}
		
	}

}