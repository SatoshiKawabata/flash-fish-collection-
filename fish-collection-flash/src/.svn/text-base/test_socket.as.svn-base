package
{
	import com.bit101.components.TextArea;
	
	import fish.collection.net.VisionClientWebSocket;
	import fish.collection.net.WebSocketHandler;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.ByteArray;

	/**
	 * 
	 * @author A12697
	 */
	public class test_socket extends Sprite implements WebSocketHandler
	{
		private var _websocket:VisionClientWebSocket;
		private var _logArea:TextArea;
		
		public function test_socket()
		{
			initialize();
		}
		
		private function initialize():void
		{
			log('initialize');
			bootstrap();
			createStage();
		}
		
		/**
		 * ソケットサーバーとのつなぎ込み 
		 * 
		 */		
		private function bootstrap():void
		{
			_websocket = new VisionClientWebSocket(this);
			_websocket.open('ws://vision.pigg.ameba.jp:8080/', 'http://vision.pigg.ameba.jp:8080/');
		}
		
		private function createStage():void
		{
			log();
			stage.addEventListener(MouseEvent.CLICK, handleStageClick);
			_logArea = new TextArea(this, stage.stageWidth-200, 20);
			_logArea.width = 200;
			_logArea.height = stage.stageHeight - _logArea.y - 10;
		}
		
		private function handleStageClick(e:MouseEvent):void
		{
			log(e);
			
			var data:Object = {
				x: e.stageX,
					y: e.stageY
			};
			
			var str:String = JSON.stringify(data);
			_websocket.send(str);
		}
		
		private function _log(... messages):void
		{
			//topLabel.text = messages.join(' ');
			_logArea.textField.appendText(messages.join(' ') + '\n');
			// scroll to bottom
			_logArea.textField.scrollV = _logArea.textField.maxScrollV;
		}
		
		//===========================================================
		// IMPLEMENTATION METHODS
		//===========================================================
		public function onClose():void
		{
			// TODO Auto Generated method stub
			log();
		}
		
		public function onData(frame:int, data:ByteArray):void
		{
			// TODO Auto Generated method stub
			log();
		}
		
		public function onHandleError(e:Error):void
		{
			// TODO Auto Generated method stub
			log(e);
		}
		
		public function onMessage(data:String):void
		{
			// TODO Auto Generated method stub
			log(data);
			_log(data);
		}
		
		public function onOpen():void
		{
			// TODO Auto Generated method stub
			log();
		}
		
		public function onSocketError(e:Error):void
		{
			// TODO Auto Generated method stub
			log(e);
		}
	}
}