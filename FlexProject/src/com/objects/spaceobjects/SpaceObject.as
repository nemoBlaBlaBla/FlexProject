package com.objects.spaceobjects
{
	import com.universe.Universe;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import mx.controls.Label;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class SpaceObject extends Sprite
	{
		//*******************************************
		protected var _mass:Number = 0;
		
		protected var _verticalAcceleration:Number = 0;
		protected var _horizontalAcceleration:Number = 0;
		protected var _xAcceleration:Number = 0;
		protected var _yAcceleration:Number = 0;
		
		protected var _verticalThrustForce:Number = 0;
		protected var _horizontalThrustForce:Number = 0;
		//protected var _xThrustForce:Number = 0;
		//protected var _yThrustForce:Number = 0;
		
		protected var _verticalResistanceCoef:Number = 20;
		protected var _horizontalResistanceCoef:Number = 30;
		//protected var _xResistanceCoef:Number = 0;
		//protected var _yResistanceCoef:Number = 0;
		
		protected var _verticalResistanceForce:Number = 0;
		protected var _horizontalResistanceForce:Number = 0;
		//protected var _xResistanceForce:Number = 0;
		//protected var _yResistanceForce:Number = 0;
		
		protected var _verticalVelocity:Number = 0;
		protected var _horizontalVelocity:Number = 0;
		protected var _xVelocity:Number = 0;
		protected var _yVelocity:Number = 0;
		
		protected var _rotationForce:Number = 0;
		protected var _rotationResistanceForce:Number = 0;
		protected var _rotationAcceleration:Number = 0;
		protected var _rotationSpeed:Number = 0;
		//*********************************************
		
		protected var _universe:Universe;
		
		private var _myTF:TextField = new TextField();
		
		public function SpaceObject(universe:Universe)
		{
			_universe = universe;
			
			var positionUpdateTimer:Timer = new Timer(20);
			positionUpdateTimer.start();
			positionUpdateTimer.addEventListener(TimerEvent.TIMER, PositionUpdate);
			_myTF.textColor = 0xffffff;
			this.addChild(_myTF);
		}
		
		private function CalculateValues():void
		{
			//calculating resistance fore using resistance coeficient and current value of velocity
			//_verticalResistanceForce = _verticalResistanceCoef * Math.abs(_verticalVelocity) * _verticalVelocity;
			//_horizontalResistanceForce = _horizontalResistanceCoef * Math.abs(_horizontalVelocity) * _horizontalVelocity;
			_verticalResistanceForce = (_verticalResistanceCoef * _verticalVelocity);// * _verticalVelocity) * (Math.abs(_verticalVelocity) / _verticalVelocity);
			_horizontalResistanceForce = (_horizontalResistanceCoef * _horizontalVelocity);// * _horizontalVelocity) * (Math.abs(_horizontalVelocity) / _horizontalVelocity);
			//calculatin accelerations
			_verticalAcceleration = (_verticalThrustForce - _verticalResistanceForce) / _mass;
			_horizontalAcceleration = (_horizontalThrustForce - _horizontalResistanceForce) / _mass;
			//converting current acceleration valuers
			//to acceleration on dementions
			_xAcceleration = _horizontalAcceleration * Math.cos((this.rotation * Math.PI) / 180) - _verticalAcceleration * Math.sin((this.rotation * Math.PI) / 180);
			_yAcceleration = _horizontalAcceleration * Math.sin((this.rotation * Math.PI) / 180) - _verticalAcceleration * Math.cos((this.rotation * Math.PI) / 180);
			//calculating currnt velocity values
			_xVelocity += _xAcceleration;
			_yVelocity += _yAcceleration;
			//************************************
			//_verticalVelocity += _verticalAcceleration;
			//_horizontalVelocity += _horizontalAcceleration;
			
			_horizontalVelocity = _xVelocity * Math.cos((this.rotation / 180) * Math.PI) + _yVelocity * Math.sin((this.rotation / 180) * Math.PI);
			_verticalVelocity = -_xVelocity * Math.sin((this.rotation / 180) * Math.PI) - _yVelocity * Math.cos((this.rotation / 180) * Math.PI);
			
			_rotationResistanceForce = _horizontalResistanceCoef * Math.abs(_rotationSpeed) * _rotationSpeed;
			_rotationAcceleration = (_rotationForce - _rotationResistanceForce) / _mass;
			_rotationSpeed += _rotationAcceleration;
			
			App.hud._tf.text = "Vertical velocity" + _verticalVelocity.toString() + "\n"
			+ "Horizontal velocity" + _horizontalVelocity.toString() + "\n"
			+ "X velocity" + _xVelocity.toString() + "\n"
			+ "Y velocity" + _yVelocity.toString() + "\n";
			
		}
		
		private function PositionUpdate(evt:TimerEvent):void
		{
			CalculateValues();
			this.y += _yVelocity;
			this.x += _xVelocity;
			
			this.rotation += _rotationSpeed;
			Test();
		}
		
		private function Test():void
		{
			_myTF.text = ("_yVelocity : " + _yVelocity + "\n" + "_xVelocity : " + _xVelocity + "\n");
		}
		
		// GETTERS AND SETTERS
		public function get mass():Number
		{
			return _mass;
		}
		
		public function set mass(value:Number):void
		{
			_mass = value;
		}
		
		public function get verticalAcceleration():Number
		{
			return _verticalAcceleration;
		}
		
		public function get horizontalAcceleration():Number
		{
			return _horizontalAcceleration;
		}
		
		public function get xAcceleration():Number
		{
			return _xAcceleration;
		}
		
		public function get yAcceleration():Number
		{
			return _yAcceleration;
		}
		
		public function get verticalThrustForce():Number
		{
			return _verticalThrustForce;
		}
		
		public function set verticalThrustForce(value:Number):void
		{
			_verticalThrustForce = value;
		}
		
		public function get horizontalThrustForce():Number
		{
			return _horizontalThrustForce;
		}
		
		public function set horizontalThrustForce(value:Number):void
		{
			_horizontalThrustForce = value;
		}
		
		public function get verticalResistanceForce():Number 
		{
			return _verticalResistanceForce;
		}
		
		public function get horizontalResistanceForce():Number 
		{
			return _horizontalResistanceForce;
		}
		
		public function get verticalVelocity():Number 
		{
			return _verticalVelocity;
		}
		
		public function get horizontalVelocity():Number 
		{
			return _horizontalVelocity;
		}
		
		public function get xVelocity():Number 
		{
			return _xVelocity;
		}
		
		public function get yVelocity():Number 
		{
			return _yVelocity;
		}
		
		public function get rotationForce():Number 
		{
			return _rotationForce;
		}
		
		public function set rotationForce(value:Number):void 
		{
			_rotationForce = value;
		}
		
		public function get rotationAcceleration():Number 
		{
			return _rotationAcceleration;
		}
		
		public function get rotationSpeed():Number 
		{
			return _rotationSpeed;
		}
	}
}