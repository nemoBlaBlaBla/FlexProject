package
{
	import com.controllers.PlayerController;
	import com.objects.spaceobjects.SpaceObject;
	import com.objects.spaceobjects.SpaceShip;
	import com.universe.Universe;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import utilities.HUD;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class App extends MovieClip
	{
		/*
		[Embed(source="/lib/ship.svg")]
		public var ShipView:Class;
		*/
		
		public static var hud:HUD = new HUD();
		
		public function App()
		{
			var u:Universe = new Universe();
			var so:SpaceShip = new SpaceShip(u);
			
			this.addChild(hud);
			so.mass = 1000;
			//so.IncreaseVelocity();
			so.controller = new PlayerController(so);
			u.addChild(so);
			this.addChild(u);
			so.rotation = 0;
			u.SetCameraTo(so);
			//trace(stage.stageHeight);
		}
	}

}