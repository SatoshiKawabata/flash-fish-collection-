package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="465", height="465", backgroundColor="0x000000", frameRate="30")]
	public class SpringSample extends Sprite
	{
		private var sp:Sprite;
		private var vx:Number=0;
		private var vy:Number=0;
		private var k:Number=0.9;
		private var f:Number=0.99;
		
		public function SpringSample()
		{
			sp=new Sprite;
			sp.graphics.beginFill(0x00ff00, 1);
			sp.graphics.drawCircle(0, 0, 10);
			sp.graphics.endFill();
			addChild(sp);
			
			addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(e:Event):void
		{
			vx+=(mouseX - sp.x) * k;
			vy+=(mouseY - sp.y) * k;
			
			sp.x+=vx;
			sp.y+=vy;
			
			vx*=f;
			vy*=f;
		}
	}
}

