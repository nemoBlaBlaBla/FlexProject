package heli_main.heli_objects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import heli_main.heli_fx.AfterBurner;
	import heli_main.heli_objects.guns.Gun;

	public class Helicopter extends Sprite
	{

		private var _mainSprite:Sprite = new SpaceFighterSprite();//new PrimitiveHeliSprite();

		private var _ABLeft:AfterBurner;// = new AfterBurner();
		private var _ABRight:AfterBurner;

		private var _gun:Gun;

		//************************************************
		public var _mass:Number = 500;
		public var _accelH:Number = 0;
		public var _accelV:Number = 0;
		public var _accelX:Number = 0;
		public var _accelY:Number = 0;
		public var _thrustForceH:Number = 0;
		public var _thrustForceV:Number = 0;
		public var _thrustForceX:Number = 0;
		public var _thrustForceY:Number = 0;
		public var _resistanceForceX:Number = 0;
		public var _resistanceForceY:Number = 0;
		public var _resistanceCoefX:Number = 0.3;
		public var _resistanceCoefY:Number = 0.3;
		public var _velocityH:Number = 0;
		public var _velocityV:Number = 0;
		public var _hPos:Number = 0;
		public var _vPos:Number = 0;
		public var _velocityX:Number = 0;
		public var _velocityY:Number = 0;
		public var _rotationSpeed:Number = 0;

		//************************************************

		public var _fxField:Sprite;

		public function Helicopter(_main:Heli_main, fxField:Sprite)
		{

			_gun = new Gun(this);

			_fxField = fxField;

			this.x = 0;
			this.y = 0;
			_mainSprite.scaleX = 0.06;
			_mainSprite.scaleY = 0.06;
			_mainSprite.alpha = 1;



			//this.addChild(_AB);
			_ABLeft = new AfterBurner(this);
			_ABLeft.x = -15;
			_ABLeft.y = 25;
			_ABRight = new AfterBurner(this);
			_ABRight.x = 15;
			_ABRight.y = 25;
			this.addChild(_ABLeft);
			this.addChild(_ABRight);
			//_AB._targetSprite = _main._game._fx;
			this.addChild(_mainSprite);
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			_main.stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
			_main.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			_main.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			_main.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMoseKeyDown);
			_main.stage.addEventListener(MouseEvent.MOUSE_UP, onMoseKeyUp);


			// constructor code;
		}

		private function moving()
		{
			_thrustForceX = _thrustForceH * Math.cos((getAngle() / 180) * Math.PI) + _thrustForceV * Math.sin((getAngle() / 180) * Math.PI);
			_thrustForceY = -_thrustForceH * Math.sin((getAngle() / 180) * Math.PI) + _thrustForceV * Math.cos((getAngle() / 180) * Math.PI);
			_resistanceForceX = _resistanceCoefX * (Math.abs(_velocityX) * _velocityX);
			_accelX = (_thrustForceX - _resistanceForceX) / (_mass);
			_velocityX +=  _accelX;
			_resistanceForceY = _resistanceCoefY * (Math.abs(_velocityY) * _velocityY);
			_accelY = (_thrustForceY - _resistanceForceY) / (_mass);
			_velocityY +=  _accelY;
			this.x +=  _velocityX;
			this.y +=   -  _velocityY;
			this.rotation +=  _rotationSpeed;
		}

		public function drawTrace(_sprite:Sprite)
		{
			//_sprite.graphics.lineStyle(22, 0xEEDB0E, 0.7);
			//_sprite.graphics.lineTo(this.x, this.y);
			//_ABLeft.addABParticle(_sprite);
			//_ABRight.addABParticle(_sprite);

		}


		private function enterFrameHandler(evt: Event)
		{
			moving();
		}

		private function keyDownHandler(evt: KeyboardEvent)
		{
			switch (evt.keyCode)
			{
				case Keyboard.W :
					_thrustForceV = 100;
					break;
				case Keyboard.S :
					_thrustForceV = -100;
					break;
				case Keyboard.A :
					_thrustForceH = -100;
					break;
				case Keyboard.D :
					_thrustForceH = 100;
					break;
				case Keyboard.E :
					_rotationSpeed = 3;
					//_mainSprite.rotation +=  3;
					break;
				case Keyboard.Q :
					_rotationSpeed = -3;
					//_mainSprite.rotation -=  3;
					break;
			}
		}

		private function keyUpHandler(evt: KeyboardEvent)
		{
			switch (evt.keyCode)
			{
				case Keyboard.W :
					_thrustForceV = 0;
					break;
				case Keyboard.S :
					_thrustForceV = 0;
					break;
				case Keyboard.A :
					_thrustForceH = 0;
					break;
				case Keyboard.D :
					_thrustForceH = 0;
					break;
				case Keyboard.E :
					_rotationSpeed = 0;
					break;
				case Keyboard.Q :
					_rotationSpeed = 0;
					break;
			}
		}

		public function getAngle():Number
		{
			return this.rotation;
		}

		public function getThrustForceV():Number
		{
			return this._thrustForceV;
		}

		private function onMoseKeyDown(evt:MouseEvent)
		{
			_gun.startShooting();
		}

		private function onMoseKeyUp(evt:MouseEvent)
		{
			_gun.stopShooting();
		}

		private function mouseWheelHandler(evt: MouseEvent)
		{
			if (evt.delta > 0)
			{
				_thrustForceV +=  10;
			}
			else
			{
				_thrustForceV -=  10;
			}
		}

	}

}