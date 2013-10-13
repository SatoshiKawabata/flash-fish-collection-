/**
 * Copyright mousepancyo ( http://wonderfl.net/user/mousepancyo )
 * MIT License ( http://www.opensource.org/licenses/mit-license.php )
 * Downloaded from: http://wonderfl.net/c/aruo
 */

package {    
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	
	[SWF(backgroundColor=0xFFFFFF, width=465, height=465, frameRate=30)]
	public class IKSample extends Sprite {
		private var numRopes:Number = 1;
		
		public function IKSample() {
			for( var i:int = 0; i < numRopes; i++ ){
				var posX:Number = (( 200 / (numRopes-1) ) * i) + 132;
				for(var n:int = 0; n < numRopes; n++){
					var posY:Number = (( 200 / (numRopes-1) ) * n) + 132;
					var chain:IKLine = new IKLine( posX, posY , 20);
					addChild(chain);
					chain.filters = [new GlowFilter(0, 1, 2, 2, 3, 1, false, false)]
				}
			}
		}
		
	}
}


import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;

class IKLine extends Sprite {
	
	private var _segments:Array;
	private var _segmentNum:Number = 10;
	
	public function IKLine(posX:Number, posY:Number, len:int) {
		_segments = new Array();
		for(var i:uint = 0; i<_segmentNum; i++){
			var seg:IKSegment = new IKSegment(len, 3);
			addChild(seg);
			_segments.push(seg);
		}
		seg.x = posX;
		seg.y = posY;
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):void {
		var p:Point = reach(_segments[0], mouseX, mouseY);
		for(var i:uint = 1; i < _segmentNum; i++){
			var seg:IKSegment = _segments[i];
			p = reach(seg, p.x, p.y);
		}
		for(i = _segmentNum - 1; i>0; i--){
			var segA:IKSegment = _segments[i];
			var segB:IKSegment = _segments[i-1];
			position(segB, segA);
		}
	}
	
	private function reach(seg:IKSegment, xPos:Number, yPos:Number):Point {
		var dx:Number = xPos - seg.x;
		var dy:Number = yPos - seg.y;
		var angle:Number = Math.atan2(dy, dx);
		seg.rotation = angle * 180 / Math.PI;
		//
		var w:Number = seg.getPin().x - seg.x;
		var h:Number = seg.getPin().y - seg.y;
		var tx:Number = xPos - w;
		var ty:Number = yPos - h;
		var p:Point = new Point(tx, ty);
		return p;
	}
	
	private function position(segA:IKSegment, segB:IKSegment):void {
		segA.x = segB.getPin().x;
		segA.y = segB.getPin().y;
	}
}


import flash.display.Sprite;
import flash.geom.Point;

class IKSegment extends Sprite {
	
	private var _width:Number;
	private var _height:Number;
	
	public var vx:Number = 0;
	public var vy:Number = 0;
	
	public function IKSegment(w:Number,h:Number) {
		_width = w;
		_height = h;
		//
		graphics.beginFill(0xFFFFFF);
		graphics.drawCircle(0, 0, 3);
		graphics.drawCircle(_width, 0, 3);
		graphics.drawRoundRect(-_height * .5, -_height * .5, _width+_height, _height, _height, _height);
	}
	
	public function getPin():Point {
		var angle:Number = rotation * Math.PI / 180;
		var xPos:Number = x + Math.cos(angle) * _width;
		var yPos:Number = y + Math.sin(angle) * _width;
		var p:Point = new Point(xPos, yPos);
		return p;
	}
}