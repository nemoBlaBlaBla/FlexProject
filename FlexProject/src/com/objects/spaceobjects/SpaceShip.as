package com.objects.spaceobjects 
{
	import com.controllers.Controller;
	import com.objects.shipmodules.Engine;
	import com.universe.Universe;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class SpaceShip extends SpaceObject 
	{
		[Embed(source="/lib/ship.svg")]
		public var ShipView:Class;

		
		public var _engine:Engine;// = new Engine(this);
		protected var _controller:Controller;
		//protected var _view:Sprite;
		
		
		public function SpaceShip(universe:Universe) 
		{
			super(universe);
			_engine = new Engine(this);
			var view:Sprite = new ShipView();
			view.x = -view.width / 2;
			view.y = -view.height / 2;
			this.addChild(view);
		}
		
		public function get controller():Controller 
		{
			return _controller;
		}
		
		public function set controller(value:Controller):void 
		{
			_controller = value;
		}
		
		
		
	}

}