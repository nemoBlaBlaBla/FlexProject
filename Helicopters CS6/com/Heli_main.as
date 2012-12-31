package 
{

	import flash.display.MovieClip;
	import heli_main.Heli_game;


	public class Heli_main extends MovieClip
	{
		public var _game:Heli_game;

		public function Heli_main()
		{
			startGame();
			// constructor code
		}
		
		private function startGame()
		{
			_game = new Heli_game(this);
			this.addChild(_game);
		}

	}
}