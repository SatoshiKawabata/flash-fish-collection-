package fish.collection.game
{
	import fish.collection.game.view.Boid;
	import fish.collection.game.view.hogeSprite;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import pigglife.view.RootStage;
	
	import starling.core.Starling;
	
	
	public class GameView extends Sprite
	{
		private var _idelegate:GameInternalDelegate;
		private var _container:Sprite;
		
		// Boidの数
		private const NUMBOIDS:int = 80;
		// Boidクラス
		private var boids:Array = new Array();
		// 描画用Sprite
		private var sprites:Array = new Array();
		// 魚描画レイヤー
		private var _fishLayer:Sprite;
		

		public function get view():Sprite {return _container;}
		
		public function GameView()
		{
			super();
		}
		
		/**
		 * 初期化
		 */
		public function initialize(idelegate:GameInternalDelegate):void
		{
			_idelegate = idelegate;
			_container = new Sprite();
			addChild(_container);
			
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
			
			_fishLayer = new Sprite();
			for (i = 0; i < NUMBOIDS; i++)
			{
				_fishLayer.addChild(sprites[i]);
			}
			_container.addChild(_fishLayer);
			
			/*
			// Starling test
			trace(stage);
			var myStarling:Starling = new Starling(hogeSprite, RootStage.stage);
			myStarling.start();
			*/
			
			// 毎フレーム処理イベント設定
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
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