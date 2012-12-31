package heli_main.heli_objects.guns
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import heli_main.heli_objects.Helicopter;
	import flash.events.Event;


	public class Gun
	{

		private var _bulletSpeed:Number = 100;//скорость полета пули
		private var _damage:Number;//урон за один выстрел
		private var _fireRate:Number = 125;//скорострельность
		private var _host:Helicopter;
		private var _doShot:Boolean = false;


		public function Gun(host:Helicopter)
		{
			_host = host;

			var shotTimer:Timer = new Timer(_fireRate);
			shotTimer.addEventListener(TimerEvent.TIMER, onTick);
			shotTimer.start();


			// constructor code;
		}

		public function startShooting()
		{
			/*var shotTimer:Timer = new Timer(_fireRate, 3);
			shotTimer.addEventListener(TimerEvent.TIMER, onTick);
			shotTimer.start();*/

			/*var _b:Bullet = new Bullet();
			var rand:Number = (Math.random() * 5) - 2.5;
			_b.x = _host.x;// + this.x;
			_b.y = _host.y;// + this.y;
			_host._fxField.addChild(_b);
			_b.rotation = _host.getAngle() + rand;
			_b.addEventListener(Event.ENTER_FRAME, bulletLife);*/

			_doShot = true;
		}
		
		public function stopShooting()
		{
			_doShot = false;
		}

		private function onTick(evt:TimerEvent)
		{
			if (_doShot == true)
			{
				var _b:Bullet = new Bullet();
				var rand:Number = (Math.random() * 5) - 2.5;
				_b.x = _host.x;// + this.x;
				_b.y = _host.y;// + this.y;
				_host._fxField.addChild(_b);
				_b.rotation = _host.getAngle() + rand;
				_b.addEventListener(Event.ENTER_FRAME, bulletLife);
			}
		}

		private function bulletLife(evt:Event)
		{
			var mc:MovieClip = MovieClip(evt.target);
			mc.x += _bulletSpeed * (Math.sin((mc.rotation/180) * Math.PI));
			mc.y += _bulletSpeed * (-Math.cos((mc.rotation/180) * Math.PI));
			mc.alpha -=  0.002;

			if (mc.alpha < 0.9)
			{
				mc.removeEventListener(Event.ENTER_FRAME, bulletLife);
				_host._fxField.removeChild(mc);
				mc = null;
				trace("bullet deleted");
			}
		}

	}

}