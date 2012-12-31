package com.controllers
{
	import com.objects.spaceobjects.SpaceShip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Controller extends Sprite
	{
		
		protected var _ship:SpaceShip;
		
		public function Controller(ship:SpaceShip)
		{
			_ship = ship;
		}
		
		protected function MoveForward():void
		{
			//_ship.IncreaseVelocity();
			_ship._engine.MaximumThrust();
		}
		
		protected function MoveBackward():void
		{
			//_ship.DecreaseVelocity();
			_ship._engine.MinimalThrust();
		}
		
		protected function MoveLeft():void
		{
			_ship._engine.LeftStrafe();
		}
		
		protected function MoveRight():void
		{
			_ship._engine.RightStrafe();
		}
		
		protected function LeftTurn():void 
		{
			_ship._engine.TurnLeft();
		}
		
		protected function RightTurn():void
		{
			_ship._engine.TurnRight();
		}
	}

}