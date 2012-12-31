package com.controllers
{
	import com.objects.spaceobjects.SpaceShip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class PlayerController extends Controller
	{
		
		public function PlayerController(ship:SpaceShip)
		{
			super(ship);
			_ship.addChild(this);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		private function onAddToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			trace("ADDED!!!");
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				_ship._engine.StopEngine();
				trace("KeyUp W");
			}
			if (e.keyCode == Keyboard.S)
			{
				_ship._engine.StopEngine();
				trace("KeyUp S");
			}
			if (e.keyCode == Keyboard.A)
			{
				_ship._engine.StopEngine();
				trace("KeyUp A");
			}
			if (e.keyCode == Keyboard.D)
			{
				_ship._engine.StopEngine();
				trace("KeyUp D");
			}
			if (e.keyCode == Keyboard.Q)
			{
				_ship._engine.StopTurn();
				trace("KeyUp Q");
			}
			if (e.keyCode == Keyboard.E)
			{
				_ship._engine.StopTurn();
				trace("KeyUp E");
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				this.MoveForward();
				trace("KeyDown W");
			}
			if (e.keyCode == Keyboard.S)
			{
				this.MoveBackward();
				trace("KeyDown S");
			}
			if (e.keyCode == Keyboard.A)
			{
				this.MoveLeft();
				trace("KeyDown A");
			}
			if (e.keyCode == Keyboard.D)
			{
				this.MoveRight();
				trace("KeyDown D");
			}
			if (e.keyCode == Keyboard.Q)
			{
				this.LeftTurn();
				trace("KeyDown Q");
			}
			if (e.keyCode == Keyboard.E)
			{
				this.RightTurn();
				trace("KeyDown E");
			}
		}
	
	}

}