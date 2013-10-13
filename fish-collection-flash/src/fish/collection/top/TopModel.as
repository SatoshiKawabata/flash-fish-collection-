package fish.collection.top
{
	import fish.collection.MainDelegate;
	
	import pigglife.view.ViewContainer;

	/**
	 * 
	 * @author A12697
	 */
	public class TopModel
	{
		//=========================================================
		// VARIABLES
		//=========================================================
		private var _idelegate:TopInternalDelegate;
		private var _container:ViewContainer;
		private var _topView:TopView;
		
		//===========================================================
		// PUBLIC METHODS
		//===========================================================
		public function TopModel()
		{
		}
		
		/**
		 * 初期化 
		 */
		public function initialize(delegate:MainDelegate, container:ViewContainer):void
		{
			_idelegate = new TopInternalDelegate(this, delegate);
			_container = container;
		}
		
		public function showTop():void
		{
			_topView = new TopView(_idelegate);
			_topView.initialize();
			_container.addUI(_topView.view);
		}
		
		/**
		 * clean 
		 */
		public function clean():void
		{
			_topView.clean();
		}
	}
}