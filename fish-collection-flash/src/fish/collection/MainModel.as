package fish.collection
{
	import fish.collection.entry.EntryModel;
	import fish.collection.game.GameModel;
	import fish.collection.net.VisionClient;
	import fish.collection.top.TopModel;
	
	import pigglife.view.ViewContainer;

	public class MainModel
	{
		//=========================================================
		// VARIABLES
		//=========================================================
		private var _client:VisionClient;
		private var _config:Configuration;
		private var _delegate:MainDelegate;
		private var _facade:MainFacade;
		private var _container:ViewContainer;
		private var _topModel:TopModel;
		private var _entryModel:EntryModel;
		private var _gameModel:GameModel;
		
		//=========================================================
		// GETTER/SETTER
		//=========================================================
		public function set client(client:VisionClient):void
		{
			_client = client;
		}
		
		public function set delegate(delegate:MainDelegate):void
		{
			_delegate = delegate;
		}
		
		public function set facade(facade:MainFacade):void
		{
			_facade = facade;
		}
		
		public function set container(value:ViewContainer):void
		{
			_container = value;
		}
		
		//===========================================================
		// PUBLIC METHODS
		//===========================================================
		public function MainModel()
		{
		}
		
		/**
		 * 初期化 
		 */
		public function initialize():void
		{
			if (!_topModel)
			{
				_topModel = new TopModel();
				_topModel.initialize(_delegate, _container);
			}
			_topModel.showTop();
		}
		
		public function showEntry():void
		{
			if (!_entryModel)
			{
				_entryModel = new EntryModel();
				_entryModel.initialize(_delegate, _container);
			}
			_entryModel.showEntry();
		}
		
		/**
		 * ゲームモジュールを表示
		 */
		public function showGame():void
		{
			if (!_gameModel)
			{
				_gameModel = new GameModel();
				_gameModel.initialize(_delegate, _container);
			}
			_gameModel.showGame();
		}
		
		/**
		 * スタート 
		 */
		public function start():void
		{
			openClient();
		}
		
		/**
		 *　ソケットサーバーを開く 
		 */
		public function openClient():void
		{
			_client.open(_config.serverUrl, _config.serverOrigin);
		}
		
		public function showError(error:Error, block:Boolean = false):void
		{
			log(error);
		}
		
		public function cleanEntry():void
		{
			
		}
	}
}