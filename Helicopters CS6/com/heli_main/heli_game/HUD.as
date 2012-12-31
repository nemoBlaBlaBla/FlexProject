package heli_main.heli_game
{

	import flash.text.*;
	import flash.display.Sprite;
	import heli_main.heli_objects.Helicopter;
	import flash.filters.GlowFilter;
	import flash.filters.BlurFilter;
	import flash.events.Event;

	public class HUD extends Sprite
	{

		private var _HUDField: TextField = new TextField();
		private var _glowFilter: GlowFilter = new GlowFilter(0x33FFCC, 1, 5, 5, 1, 2);
		private var _blurFilter: BlurFilter = new BlurFilter(1, 1, 1);
		private var _filtersArray:Array = new Array(_glowFilter, _blurFilter);
		//private var _myFont:Hyperspace = new Hyperspace();
		private var _myFont:ScoreBoard = new ScoreBoard();
		//private var _myFont:BytePolice = new BytePolice();


		public function HUD()
		{
			//_HUDField.filters = _filtersArray;
			
			_HUDField.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			// constructor code
		}

		public function testHUD(_heli:Helicopter)
		{
			
			//TF.embedFonts = true;
			_HUDField.embedFonts = true;
			//**
			var TF:TextFormat = new TextFormat();
			//TF.font = "SquareHead";
			TF.font = _myFont.fontName;
			//TF.color = 0x66CCFF;
			TF.color = 0x33FF99;
			TF.size = 21;
			_HUDField.defaultTextFormat = TF;
			//**
			//_HUDField.textColor = 0x00BB00;
			_HUDField.x = 10;
			_HUDField.y = 10;
			_HUDField.selectable = false;
			_HUDField.height = 1000;
			_HUDField.width = 1000;
			_HUDField.antiAliasType = AntiAliasType.ADVANCED;
			this.addChild(_HUDField);
			_HUDField.text = ("MASS = " + _heli._mass + "\n");
			_HUDField.appendText("HORIZONTAL_THRUST FORCE = " + _heli._thrustForceH.toFixed(3) + "\n");
			_HUDField.appendText("VERTICAL_THRUST FORCE = " + _heli._thrustForceV.toFixed(3) + "\n");
			_HUDField.appendText("X_THRUST_FORCE = " + _heli._thrustForceX.toFixed(3) + "\n");
			_HUDField.appendText("Y_THRUST_FORCE = " + _heli._thrustForceY.toFixed(3) + "\n");
			_HUDField.appendText("X_ACCELERATION = " + _heli._accelX.toFixed(3) + "\n");
			_HUDField.appendText("Y_ACCELERATION = " + _heli._accelY.toFixed(3) + "\n");
			_HUDField.appendText("HORIZONTAL_RESISTANCE_FORCE = " + _heli._resistanceForceX.toFixed(3) + "\n");
			_HUDField.appendText("VERTICAL_RESISTANCE_FORCE = " + _heli._resistanceForceY.toFixed(3) + "\n");
			_HUDField.appendText("HORIZONTAL_RESISTANCE_FACTOR = " + _heli._resistanceCoefX.toFixed(3) + "\n");
			_HUDField.appendText("VERTICAL_RESISTANCE_FACTOR = " + _heli._resistanceCoefY.toFixed(3) + "\n");
			_HUDField.appendText("X_VELOCITY = " + _heli._velocityX.toFixed(3) + "\n");
			_HUDField.appendText("Y_VELOCITY = " + _heli._velocityY.toFixed(3) + "\n");
			_HUDField.appendText("X_POSITION = " + _heli.x + "\n");
			_HUDField.appendText("Y_POSITION = " + _heli.y + "\n");
		}
		
		private function enterFrameHandler(evt: Event)
		{
			var r:Number = Math.random() * 0.1;
			_HUDField.alpha = 1 - r;
		}

	}

}