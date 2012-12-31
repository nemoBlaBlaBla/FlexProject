package utilities 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class HUD extends Sprite 
	{
		public var _tf:TextField = new TextField();
		
		public function HUD() 
		{
			_tf.textColor = 0xffffff;
			_tf.width = 400;
			this.addChild(_tf);
		}
		
	}

}