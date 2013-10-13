package
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.StageDisplayState;

	[SWF(width="1920",height="1080",frameRate="24",backgroundColor="#999999")]
	public class mock_fish_collection extends fish_collection
	{
		public function mock_fish_collection()
		{
			var rate:Number = 1080/1920;
			var height:int = 500;
			this.scaleX = this.scaleY = height/1080;
			var shape:Shape = new Shape();
			var g:Graphics = shape.graphics;
			g.beginFill(0xff0000);
			g.drawRect(0, 0, height/rate, height);
			g.endFill();
			mask = shape;
			super();
			LogConfig.enabled = true;
			stage.displayState = StageDisplayState.NORMAL;
		}
		
		override protected function initApp():void
		{
			super.initApp();
		}
	}
}