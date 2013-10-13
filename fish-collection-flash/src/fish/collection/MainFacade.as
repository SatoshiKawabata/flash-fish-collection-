package fish.collection
{
	import fish.collection.net.VisionClient;
	
	import pigglife.util.Callback;

	/**
	 * 
	 * @author A12697
	 */
	public class MainFacade
	{
		//=========================================================
		// PROPERTIES
		//=========================================================
		private var _client:VisionClient;
		private var _config:Configuration;
		private var _model:MainModel;
		
		public function set client(client:VisionClient):void { _client = client; }
		public function set config(value:Configuration):void { _config = value; }
		public function set model(model:MainModel):void { _model = model; }
		
		public function MainFacade()
		{
		}
		
		/**
		 * 接続後のログイン処理
		 */
		public function request( mode:String ):void
		{
			log();
			_client.send('user.login', {}, new Callback(onGet).onError(errorLogin));
		}
		
		private function onGet(data:Object):void
		{
			
		}
		
		private function errorLogin(err:Error):void
		{
			_model.showError(err,true);
		}
	}
}