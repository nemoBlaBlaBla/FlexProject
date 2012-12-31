package test 
{
	import flash.display.Sprite;
	import mx.core.IVisualElement;
	import spark.core.SpriteVisualElement;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class NewClass extends SpriteVisualElement
	{
		
		public function NewClass() 
		{
			this.graphics.beginFill(0xff0000);
			this.graphics.drawRect(100, 100, 100, 100);
		}
		
	}

}