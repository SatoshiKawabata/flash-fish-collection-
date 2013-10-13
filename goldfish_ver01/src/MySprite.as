package 
{
	import starling.display.Sprite;
	import starling.display.Quad;
	import starling.events.Event;
	public class MySprite extends Sprite 
	{
		private var square:Quad;
		private var nUnit:Number = 50;
		public function MySprite() 
		{
			square = new Quad(nUnit, nUnit, 0x0000FF);
			addChild(square);
			square.x = nUnit;
			square.y = nUnit;
			addEventListener(Event.ENTER_FRAME, rotate);
		}
		private function rotate(eventObject:Event):void 
		{
			square.rotation += 0.1;
		}
	}
}