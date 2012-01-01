package flashmmorpg.areas.tiles 
{
	import flashmmorpg.areas.Tile;
	import flashmmorpg.assets.Assets;
	import flashmmorpg.sprites.SpriteSheet;
	/**
	 * ...
	 * @author Knut
	 */
	public class Grass extends Tile
	{
		
		public function Grass() 
		{
			super(new SpriteSheet(new Assets.Tileset1(), 32, 32).getTile(0), false);
		}
		
	}

}