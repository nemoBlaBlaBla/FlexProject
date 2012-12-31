package heli_main
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import heli_main.heli_objects.Helicopter;
	import heli_main.heli_levels.Level;
	import heli_main.heli_game.HUD;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import fl.motion.MatrixTransformer;
	import flash.geom.Point;


	public class Heli_game extends Sprite
	{

		private var _universe:Sprite = new Sprite();
		private var _world:Sprite = new Sprite();
		public var _fx:Sprite = new Sprite();//спрайт на котором будут отображаться эффекты
		private var _player:Helicopter;
		private var _map: Level = new Level();
		private var _hud:HUD = new HUD();

		//********************************************
		private var _testPoint:Point = new Point(0,0);
		private var _tpSpeed:Point = new Point();
		private var _testAngle:Number = 0;
		private var _taSpeed:Number = 0;




		public function Heli_game()
		{
			_world.addChild(_map);
			_world.addChild(_fx);
			//_world.scaleX = 0.3;
			//_world.scaleY = 0.3;
			_player = new Helicopter(_main,_fx);

			_world.addChild(_player);


			this.addEventListener(Event.ENTER_FRAME, onNewFrame);
			
			_universe.addChild(_world);

			this.addChild(_universe);
			
			_universe.x = 640 + _player.x;
			_universe.y = 520 + _player.y;

			//this.addChild(_world);
			

			this.addChild(_hud);



			// constructor code
		}

		private function rotateCam()
		{

		}
		
		
		private function angleConvert(angle:Number):Number
		{
			var r:Number;
			if (angle < 0)
			{
				r = 360 + angle;
			}
			else
			{
				//r = 0 + angle;
				r = angle % 360;
			}
			
			return r;
		}


		private function onNewFrame(evt:Event)
		{
			//***********************************************************
			_testPoint.x +=  _tpSpeed.x;
			_testPoint.y +=  _tpSpeed.y;
			
			_testAngle += angleConvert(_taSpeed);
			
			
			//trace("Test Point = " + _testPoint);
			trace("Test Angle = " + _testAngle);
			//_tpSpeed.x = _player.x - _testPoint.x;
			//_tpSpeed.y = _player.y - _testPoint.y;


			//_tpSpeed.x = ((_player.x - _testPoint.x) * Math.abs((_player.x - _testPoint.x))) / 4;
			//_tpSpeed.y = ((_player.y - _testPoint.y) * Math.abs((_player.y - _testPoint.y))) / 4;
			
			_tpSpeed.x = 0.5 * (_player.x - _testPoint.x);
			_tpSpeed.y = 0.5 * (_player.y - _testPoint.y);
			
			_taSpeed = 0.2 * (angleConvert(_player.rotation) - angleConvert(_testAngle));
			
			//trace("TP Speed = " + _tpSpeed);
			
			trace("TA Speed = " + _taSpeed);
			//***********************************************************
			
			
			//_world.x = -(_player.x * Math.cos((_player.getAngle()/180) * Math.PI) + _player.y * Math.sin((_player.getAngle()/180) * Math.PI)) + 640;
			//_world.y = -(_player.y * Math.cos((_player.getAngle()/180) * Math.PI) - _player.x * Math.sin((_player.getAngle()/180) * Math.PI)) + 520;
			
			//***********************************************************
			
			_world.scaleX = (-Math.sqrt(Math.pow(_player._velocityY, 2) + Math.pow(_player._velocityX, 2)) / 50) + 1;//0.4;
			_world.scaleY = (-Math.sqrt(Math.pow(_player._velocityY, 2) + Math.pow(_player._velocityX, 2)) / 50) + 1;//0.4;
			
			
			//_world.x = (-(_testPoint.x * Math.cos((_player.getAngle()/180) * Math.PI) + _testPoint.y * Math.sin((_player.getAngle()/180) * Math.PI)) * _world.scaleX) + 640;
			//_world.y = (-(_testPoint.y * Math.cos((_player.getAngle()/180) * Math.PI) - _testPoint.x * Math.sin((_player.getAngle()/180) * Math.PI)) * _world.scaleX) + 520;
			
			
			/////_world.x = (-(_testPoint.x * Math.cos((_testAngle/180) * Math.PI) + _testPoint.y * Math.sin((_testAngle/180) * Math.PI)) * _world.scaleX) + 640;
			/////_world.y = (-(_testPoint.y * Math.cos((_testAngle/180) * Math.PI) - _testPoint.x * Math.sin((_testAngle/180) * Math.PI)) * _world.scaleX) + 520;
			
			
			
			_hud.testHUD(_player);
			//_player.drawTrace(_fx);

			//_world.rotation =  -  _player.getAngle();
			
			//_world.x = - _player.x;
			//_world.y = - _player.y;
			
			_world.x = - _testPoint.x * _world.scaleX;
			_world.y = - _testPoint.y * _world.scaleY;
			
			_universe.rotation = - _player.rotation;
			
			//_universe.rotation = - _testAngle;
			
			/////_world.rotation =  -  _testAngle;

			/*trace ("угловая разница - " + (_world.rotation - _player.rotation));
			rotationSpeed = Math.pow(_world.rotation + _player.rotation, 2)/100; //(x^2)/6
			_world.rotation -= - rotationSpeed;*/

		}

	}

}