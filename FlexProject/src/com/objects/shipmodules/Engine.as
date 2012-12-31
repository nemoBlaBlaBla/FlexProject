package com.objects.shipmodules
{
	import com.objects.spaceobjects.SpaceShip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Engine extends Sprite
	{
		protected var _maxVerticalThrustForce:int = 100;
		protected var _minVerticalThrustForce:int = -100;
		protected var _currentVerticalThrustForce:int = 0;
		
		protected var _maxHorizontalThrustForce:int = 50;
		protected var _minHorizontalThrustForce:int = -50;
		protected var _currentHorizontalThrustForce:int = 0;
		
		protected var _maxRotationForce:int = 10;
		protected var _currentRotationForce:int = 0;
		
		private var _ship:SpaceShip;
		
		public function Engine(ship:SpaceShip)
		{
			_ship = ship;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			_ship.verticalThrustForce = _currentVerticalThrustForce;
			_ship.horizontalThrustForce = _currentHorizontalThrustForce;
			_ship.rotationForce = _currentRotationForce;
		}
		
		public function IncreaseVerticalThrustForce():void
		{
			if (_currentVerticalThrustForce < _maxVerticalThrustForce)
			{
				_currentVerticalThrustForce++;
				_ship.verticalThrustForce = _currentVerticalThrustForce;
			}
			else
			{
				_currentVerticalThrustForce = _maxVerticalThrustForce;
			}
		}
		
		public function DecreaseVerticalThrustForce():void
		{
			if (_currentVerticalThrustForce > _minVerticalThrustForce)
			{
				_currentVerticalThrustForce--;
				_ship.verticalThrustForce = _currentVerticalThrustForce;
			}
			else
			{
				_currentVerticalThrustForce = _minVerticalThrustForce;
			}
		}
		
		public function MaximumThrust():void 
		{
			_currentVerticalThrustForce = _maxVerticalThrustForce;
		}
		
		public function MinimalThrust():void
		{
			_currentVerticalThrustForce = _minVerticalThrustForce;
		}
		
		public function RightStrafe():void
		{
			_currentHorizontalThrustForce = _maxHorizontalThrustForce;
		}
		
		public function LeftStrafe():void
		{
			_currentHorizontalThrustForce = _minHorizontalThrustForce;
		}
		
		public function TurnLeft():void 
		{
			_currentRotationForce = - _maxRotationForce;
		}
		
		public function TurnRight():void
		{
			_currentRotationForce = _maxRotationForce;
		}
		
		public function StopTurn():void
		{
			_currentRotationForce = 0;
		}
		
		public function StopEngine():void
		{
			_currentVerticalThrustForce = 0;
			_currentHorizontalThrustForce = 0;
			//_ship.verticalThrustForce = 0;
		}
		
		public function get maxVerticalThrustForce():int
		{
			return _maxVerticalThrustForce;
		}
		
		public function get minVerticalThrustForce():int
		{
			return _minVerticalThrustForce;
		}
		
		public function get currentVerticalThrustForce():int
		{
			return _currentVerticalThrustForce;
		}
	
	}

}