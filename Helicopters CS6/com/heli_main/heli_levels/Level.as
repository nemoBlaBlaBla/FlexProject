package heli_main.heli_levels
{
	import flash.display.Sprite;
	
	public class Level extends Sprite
	
	{
		private var _mainSprite:Sprite = new testPic();

		public function Level()
		{
			drawTestMap();
			// constructor code
		}
	
		private function drawTestMap()
		{
			this.addChild(_mainSprite);
		}

	}

}