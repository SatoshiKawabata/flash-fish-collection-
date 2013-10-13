package
{
	/**
	 * タスク
	 * 
	 * マウスから逃げていく
	 * マウスクリックで捕まえる(消える)
	 */
	public class Boid 
	{
		// 整列パラメータ
		private const ALIGNMENT_X:Number = 0.2;
		private const ALIGNMENT_Y:Number = 0.2;
		// 分離パラメータ
		private const SEPARATION_X:Number = 0.9;
		private const SEPARATION_Y:Number = 0.9;
		// 結合パラメータ
		private const COHESION_X:Number = 0.1;
		private const COHESION_Y:Number = 0.1;
		// Boidの領域
		private const BOUNDING_WIDTH:int = 900;
		private const BOUNDING_HEIGHT:int = 600;
		
		// 座標
		public var px:Number, py:Number;
		// 速度
		public var vx:Number, vy:Number;
		// 加速度
		private var ax:Number, ay:Number;
		/**
		 * コンストラクタ
		 */
		public function Boid() 
		{
		}
		
		/**
		 * 他のBoidからの影響
		 */
		public function force(boids:Array) : void 
		{
			// 一番近いBoidを探す
			var nearlest:Boid = null;
			// 距離
			var dx:Number, dy:Number;
			var dist2:Number;	// 距離の自乗
			// 最短距離を保持する
			var mindist2:Number = Number.MAX_VALUE;
			// index用
			var i:String;
			// 探す用Boidインスタンス
			var b:Boid;
			var count:int = 0;
			var cx:Number = 0, cy:Number = 0;
			for (i in boids) 
			{
				// Boidを指定
				b = boids[i];
				if (b == this)	// 自分自身なら次に飛ぶ
					continue;
				// 指定したBoidまでの距離を算出
				dx = b.px - px; 
				dy = b.py - py;
				dist2 = dx * dx + dy * dy;
				// 最短距離より小さい場合
				if (dist2 < mindist2) 
				{
					mindist2 = dist2;
					// 直近のBoidを更新
					nearlest = b;
				}
				// 指定したBoidまでの距離が1500未満の場合
				if (dist2 < 1500) 
				{
					cx += b.px; 
					cy += b.py;
					count++;
				}
			}
			// 直近のBoidがいなければ抜ける
			if (nearlest == null)
				return;
			
			ax = ay = 0;
			// 直近のBoidの情報を保持
			var npx:Number = nearlest.px;
			var npy:Number = nearlest.py;
			var nvx:Number = nearlest.vx;
			var nvy:Number = nearlest.vy;            
			dx = (npx - px); dy = (npy - py);
			dist2 = dx * dx + dy * dy;
			// 遠すぎれば抜ける
			if (dist2 > 1500)
				return;
			
			// Separation(分離)
			var dist:Number = Math.sqrt(dist2);
			ax += dx / dist * (dist - 25) * SEPARATION_X;
			ay += dy / dist * (dist - 25) * SEPARATION_Y;
			
			// Alignment(整列)
			ax += (nvx - vx) * ALIGNMENT_X; 
			ay += (nvy - vy) * ALIGNMENT_Y;
			
			// Cohesion(結合)
			dx = (cx/count - px); 
			dy = (cy/count - py);
			ax += dx * COHESION_X; 
			ay += dy * COHESION_Y;
			ax += 3 * (Math.random() - 0.5); 
			ay += 3 * (Math.random() - 0.5);   
			
			// boundary(境界)
			if (px < 50)
				ax += (50 - px) * 0.1;
			else if (px > BOUNDING_WIDTH-50)
				ax += (BOUNDING_WIDTH-50 - px) * 0.1;
			if (py < 50)
				ay += (50 - py) * 0.1;
			else if (py > BOUNDING_HEIGHT-50)
				ay += (BOUNDING_HEIGHT-50 - py) * 0.1;
		}
		
		/**
		 * 自身の更新関数
		 */
		public function update() : void
		{
			px += vx * (1.0/5); 
			py += vy * (1.0/5);
			vx += ax * (1.0/5); 
			vy += ay * (1.0/5);
			
			// speed limit
			var v:Number = Math.sqrt(vx * vx + vy * vy);
			if (v > 25) 
			{
				vx = vx / v * 25; vy = vy / v * 25;
			} 
			else if (v < 8) 
			{
				vx = vx / v * 8; vy = vy / v * 8;
			}
		}
	}
}