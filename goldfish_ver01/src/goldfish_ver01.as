package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import starling.core.Starling;

	[SWF(width="900", height="600", backgroundColor="0xddddff")]
	public class goldfish_ver01 extends Sprite
	{
		// Boidの数
		private const NUMBOIDS:int = 80;
		// Boidクラス
		private var boids:Array = new Array();
		// 描画用Sprite
		private var sprites:Array = new Array();
		
		
		
		public function goldfish_ver01()
		{
			// フレームレートの計算
			stage.frameRate = 30;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, framerate);
			
			// 毎フレーム処理イベント設定
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			// Boid初期設定
			var i:int;
			for (i = 0; i < NUMBOIDS; i++) 
			{
				var b:Boid = new Boid();
				const ph:Number = i * 2.0 * Math.PI / NUMBOIDS;
				b.px = 200 + 90 * Math.cos(ph) * Math.sin(ph);
				b.py = 200 + 40 * Math.sin(ph);
				b.vx = 90 * Math.cos(ph + Math.PI / 2 + 1);
				b.vy = 40 * Math.sin(ph + Math.PI / 2 + 1);
				boids[i] = b;
				
				sprites[i] = new Sprite();
				var g:Graphics = sprites[i].graphics;
				g.lineStyle(1, 0x0055ff);
				g.moveTo(4, 0); g.lineTo(-3, -3);
				g.lineTo(-3, 3); g.lineTo(4, 0); g.lineTo(-8, 0);
				sprites[i].x = b.px;
				sprites[i].y = b.py;
			}
			
			for (i = 0; i < NUMBOIDS; i++)
			{
				this.addChild(sprites[i]);
			}
			
			// Starling test
			trace(stage, 'a');
			var myStarling:Starling = new Starling(MySprite, stage);
			myStarling.start();
		}
		
		/**
		 * フレームレート取得関数
		 */
		protected function framerate(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			trace(stage.frameRate);
		}
		
		/**
		 * 毎フレームイベントハンドラ
		 */
		public function onEnterFrame(ev:Event) : void 
		{ 
			// 毎フレーム関数
			frame(); 
		}
		
		/**
		 * 毎フレーム関数
		 */
		public function frame() : void 
		{
			var b:Boid;
			var i:int;
			for (i = 0; i < NUMBOIDS; i++) 
			{
				b = boids[i];  
				b.force(boids);
			}  
			for (i = 0; i < NUMBOIDS; i++) 
			{             
				b = boids[i];
				b.update();
				sprites[i].x = b.px;
				sprites[i].y = b.py;
				sprites[i].rotation = Math.atan2(b.vy, b.vx) * 180 / Math.PI;
			}
		}
	}
}
