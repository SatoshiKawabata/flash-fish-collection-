package
{
	import fish.collection.MainDelegate;
	import fish.collection.MainFacade;
	import fish.collection.MainModel;
	import fish.collection.common.DesktopEnvironment;
	import fish.collection.common.VisionConfigration;
	import fish.collection.net.SimpleSocketClient;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import pigglife.ObjectContainer;
	import pigglife.util.Tween;
	import pigglife.util.TweenLiteLogic;
	import pigglife.view.RootStage;
	import pigglife.view.SimpleViewContainer;
	import pigglife.view.ViewContainer;

	[SWF(width="1000",height="700",frameRate="24",backgroundColor="#999999")]
	public class fish_collection extends Sprite
	{
		protected var container:ObjectContainer;
		
		public function fish_collection()
		{
			LogConfig.enabled = false;
			
			RootStage.stage = stage;
			stage.quality = StageQuality.HIGH;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			//stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE; 
			container = new ObjectContainer(ApplicationDomain.currentDomain);
			
			container.register(MainModel);
			container.register(MainDelegate);
			container.register(MainFacade);
			
			container.register(ViewContainer,  new SimpleViewContainer(this));
			container.register(DesktopEnvironment);
			container.register(SimpleSocketClient);
			container.register(VisionConfigration);
			
			Tween.logic = new TweenLiteLogic();
			enableDragg();
			
			initApp();
		}
		
		//=========================================================
		// PRIVATE METHODS
		//=========================================================
		
		protected function initApp():void
		{
			container.initialize();
		}
		
		private function enableDragg():void
		{
			RootStage.stage.addEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);
		}
		
		private function _onMouseDown(e:MouseEvent):void
		{
			e.stopPropagation();
			stage.nativeWindow.startMove(); 
		}
	}
}