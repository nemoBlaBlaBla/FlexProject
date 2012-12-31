package com.universe
{
	import com.objects.spaceobjects.SpaceObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import utilities.Cam;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Universe extends Sprite
	{
		//protected var _cameraRect:Rectangle = new Rectangle(0, 0, 800, 800);
		protected var _focusObject:SpaceObject;
		
		//public var _camSpriteTest:Sprite = new Sprite();
		
		protected var _myCam:Cam = new Cam();
		
		public function Universe()
		{
			this.addChild(_myCam);
			
			var cameraUpdateTimer:Timer = new Timer(20);
			cameraUpdateTimer.start();
			cameraUpdateTimer.addEventListener(TimerEvent.TIMER, onTimerTick);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.addEventListener(Event.ADDED_TO_STAGE, onAdding);
			//trace(parent.stage.stageHeight);
		}
		
		private function onTimerTick(e:TimerEvent):void
		{
			//this.x = (stage.stageWidth / 2) - _focusObject.x;
			//this.y = (4 * stage.stageHeight / 5) - _focusObject.y;
			
			_myCam.x = -(_myCam.width / 2) + _focusObject.x;
			_myCam.y = -(_myCam.height / 2) + _focusObject.y;
			
			/*this.scrollRect = _cameraRect;
			try
			{
				_cameraRect.x = _focusObject.x + _focusObject.horizontalVelocity - (stage.stageWidth / 2);
				_cameraRect.y = _focusObject.y + _focusObject.verticalVelocity - ((4 * stage.stageWidth) / 5);
			}
			catch (err:Error)
			{
				trace(err.errorID);
				trace(err.name);
				trace(err.message);
				_cameraRect.x = 0;
				_cameraRect.y = 0;
			}*/
		}
		
		public function SetCameraTo(object:SpaceObject):void
		{
			_focusObject = object;
		}
		
		private function onAdding(e:Event):void
		{
			trace(parent.name);
			trace(stage.stageHeight);
		}
		
		private function onEnterFrame(e:Event):void
		{
		
		}
	
	}

}