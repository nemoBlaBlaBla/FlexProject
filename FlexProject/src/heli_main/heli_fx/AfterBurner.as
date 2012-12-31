package heli_main.heli_fx
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import flash.events.Event;
	import heli_main.heli_objects.Helicopter;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	
	

	public class AfterBurner extends Sprite
	{
		public var _targetSprite:Sprite = new Sprite();

		private var _testSprite:Sprite = new Sprite();
		
		private var _host:Helicopter;
		
		private var _speed:Number;
		
		private var _thrustForce:Number;

		public function AfterBurner(host:Helicopter)
		{
			_host = host;
			//_thrustForce = thrustForce;
			// constructor code
			
			this.addEventListener(Event.ENTER_FRAME, newFrameHandler);

		}
		
		private function newFrameHandler(evt:Event)
		{
			addABParticle(_host);
		}
		
		public function addABParticle(tgtSprt:Sprite)
		{
			_targetSprite = tgtSprt;
			var particleSprite:ABParticle = new ABParticle();
			var _randomX = (Math.random() * 7) - 3.5;
			var _randomY = (Math.random() * 7) - 3.5;
			particleSprite.x = /*_hostSprite.x + */this.x + _randomX;
			particleSprite.y = /*_hostSprite.y + */this.y + _randomY;
			_targetSprite.addChild(particleSprite);
			particleSprite.addEventListener(Event.ENTER_FRAME, particleLife);
		}
		
		private function particleLife(evt:Event)
		{
			var s:MovieClip = MovieClip(evt.target);
			_speed = _host.getThrustForceV() / 20;
			s.y += _speed;
			if (s.currentFrame == s.totalFrames)
			{
				s.removeEventListener(Event.ENTER_FRAME, particleLife);
				_targetSprite.removeChild(s);
				s = null;
			}
		}



	}

}