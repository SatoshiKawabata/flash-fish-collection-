package fish.collection.common
{
	public class VisionConfigration
	{
		public function VisionConfigration()
		{
		}
		
		public function get debugMode():Boolean
		{
			return true;
		}
		
		public function get staticUrl():String
		{
			return '';
		}
		
		public function get ustaticUrl():String
		{
			return staticUrl;
		}
		
		public function get serverUrl():Array
		{
			return [];
		}
		
		public function get serverOrigin():String
		{
			return '';
		}
		
		public function get pigglifeUrl():String
		{
			return 'http://life.pigg.ameba.jp/';
		}
		
		public function get pigglifeLogoutUrl():String
		{
			return 'http://life.pigg.ameba.jp/logout';
		}
		
		
		public function motion(code:String):String
		{
			return staticUrl + 'content/motion/' + code + '.mot';
		}
		
		public function itemThumbnail(type:String, code:String):String
		{
			return staticUrl + 'content/item/' + type + '/thumb/' + code + '.dat';
		}
		
		public function itemDat(type:String, code:String):String
		{
			return staticUrl + 'content/item/' + type + '/dat/' + code + '.dat';
		}
		
		public function itemSwf(type:String, code:String):String
		{
			return staticUrl + 'content/item/' + type + '/swf/' + code + '.swf';
		}
		
		public function sound(code:String):String
		{
			return staticUrl + 'content/sound/' + code + '.swf';
		}
		
		public function moduleUrl(module:String):String
		{
			return versionUrl(staticUrl + 'content/swf/', '/' + module + '.swf');
		}
		
		public function questNpc(code:String):String
		{
			return staticUrl + 'content/quest/npc/' + code + '.swf';
		}
		
		public function questDat(code:String):String
		{
			return staticUrl + 'content/quest/thumb/' + code + '.dat';
		}
		
		public function tipsDat(code:String):String
		{
			return staticUrl + 'content/tips/thumb/' + code + '.dat';
		}
		
		public function shop(code:String):String
		{
			return staticUrl + 'content/shop/' + code + '.swf';
		}
		
		public function ideabook(code:String):String
		{
			return staticUrl + 'content/ideabook/' + code + '.swf';
		}
		
		public function barter(code:String):String
		{
			return staticUrl + 'content/barter/' + code + '.swf';
		}
		
		public function userThumbnail(type:String, code:String):String
		{
			if (!code || code.length < 4)
				return '';
			var c1:String = code.substr(0, 2);
			var c2:String = code.substr(2, 2);
			return ustaticUrl + 'upcontent/thumb/' + type + '/' + c1 + '/' + c2 + '/' + code + '.dat';
		}
		
		public function cinemaSwf(code:String):String
		{
			return staticUrl + 'content/cinema/swf/' + code + '.swf';
		}
		
		public function cinemaDat(code:String):String
		{
			return staticUrl + 'content/cinema/dat/' + code + '.dat';
		}
		
		public function areaDat(code:String):String
		{
			return staticUrl + 'content/area/dat/' + code + '.dat';
		}
		
		/**
		 * イベントドカンのPngを取得します
		 */		
		public function announceLpPng(code:String):String
		{
			return staticUrl + 'content/announce/img/' + code + '.png';
		}
		
		public function get piggLoginUrl():String
		{
			return 'http://pigg.ameba.jp/';
		}
		
		public function get statUrl():String
		{
			return 'http://stat.ameba.jp';
		}
		
		public function versionUrl(url1:String, url2:String):String
		{
			if (Environment.version == 'none')
			{
				return url1 + url2;
			}
			else if (Environment.version)
			{
				return url1 + Environment.version + url2;
			}
			else
			{
				return url1 + url2;
			}
		}
		
		public function postToBlogUrl():String
		{
			return 'http://blog.ameba.jp/ucs/entry/srventryinsertinput.do';
		}
		
		//なうAPI	
		public function get nowAPI():String
		{
			return "http://now.ameba.jp/now/campaign/pigg/";
		}
	}
}