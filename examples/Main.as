package 
{
	import com.adobe.serialization.json.JSON;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import net.wonderfl.data.APICodeData;
	import net.wonderfl.data.APIForksData;
	import net.wonderfl.data.APIScoreData;
	import net.wonderfl.data.APIUserCodesData;
	import net.wonderfl.data.APIUserData;
	import net.wonderfl.utils.WonderflAPI;
	
	/**
	 * ...
	 * @author jc at bkzen
	 */
	public class Main extends Sprite 
	{
		private var api:WonderflAPI;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			// open_api_key=a76b80051993a7c6322bf8b4bbc457b44c3d4f5c&
			//key=ABQIAAAAXpWFDG8Wm9YzscY4IEB27xSO5wqdqdHVqPB8sVJhBj86bhrVXRSBgqnsO9rxcctD5ppITaLzKCDqHA&
			//appId=fX4Z&
			//viewer.displayName=bkzen&
			//viewer.iconURL=http://wonderfl.net/images/icon/5/5c/5cda/5cda85d54f9fd460cfbe13de3b91e51e7442e136m&
			//domain=wonderfl.net
			var obj: Object = { 
				open_api_key: "a76b80051993a7c6322bf8b4bbc457b44c3d4f5c", 
				key: "ABQIAAAAXpWFDG8Wm9YzscY4IEB27xSO5wqdqdHVqPB8sVJhBj86bhrVXRSBgqnsO9rxcctD5ppITaLzKCDqHA",
				appId: "fX4Z",
				"viewer.displayName": "bkzen",
				"viewer.iconURL": "http://wonderfl.net/images/icon/5/5c/5cda/5cda85d54f9fd460cfbe13de3b91e51e7442e136m",
				domain: "wonderfl.net"
			};
			api = new WonderflAPI(obj);
			var urlLoader: URLLoader = new URLLoader();
			
			var data: APIScoreData;
			urlLoader.addEventListener(Event.COMPLETE, function(e: Event): void {
				data = new APIScoreData(JSON.decode(urlLoader.data));
				var i: int;
				for (i = 0; i < data.length; i++) 
				{
					trace(data.scores[i].score);
				}
			});
			urlLoader.load(new URLRequest(api.apiScoreGet(99, 1, api.getAppID("http://wonderfl.net/c/2A9V"))));
			
			
			/*
			var data: APIUserCodesData;
			urlLoader.addEventListener(Event.COMPLETE, function(e: Event): void {
				data = new APIUserCodesData(JSON.decode(urlLoader.data));
				var i: int;
				for (i = 0; i < data.length; i++) 
				{
					trace(data.codes[i].title);
				}
			});
			urlLoader.load(new URLRequest(api.apiUserCodes("mash")));
			*/
			
			/*
			var data: APIUserData;
			urlLoader.addEventListener(Event.COMPLETE, function(e: Event): void {
				data = new APIUserData(JSON.decode(urlLoader.data));
				trace(data.user.description);
				trace(data.user.external_url);
				trace(data.user.icon);
				trace(data.user.name);
			});
			urlLoader.load(new URLRequest(api.apiUser("bkzen")));
			*/
			
			/*
			var data: APIForksData;
			urlLoader.addEventListener(Event.COMPLETE, function(e: Event): void {
				data = new APIForksData(JSON.decode(urlLoader.data));
				for (var i: int = 0; i < data.length; i++) 
				{
					trace(data.forks[i].compile_ok);
					trace(data.forks[i].compileOK);
					trace(data.forks[i].created_date);
					trace(data.forks[i].createdDate);
				}
			});
			urlLoader.load(new URLRequest(api.apiForks(api.getAppID("http://wonderfl.net/c/dz8o"))));
			*/
			
			/*
			var data: APICodeData;
			urlLoader.addEventListener(Event.COMPLETE, function(e: Event): void {
				data = new APICodeData(JSON.decode(urlLoader.data));
				trace(data.code);
				trace(data.code.as3);
				trace(data.code.compile_ok);
				trace(data.code.compileOK);
				trace(data.code.created_date);
				trace(data.code.createdDate);
				trace(data.code.diff);
				trace(data.code.favorite_count);
				trace(data.code.forked_count);
				trace(data.code.id);
				trace(data.code.isParent);
				trace(data.code.license);
				trace(data.code.modified_date);
				trace(data.code.modifiedDate);
				trace(data.code.parent);
				trace(data.code.swf);
				trace(data.code.thumbnail);
				trace(data.code.title);
				trace(data.code.user.icon);
				trace(data.code.user.name);
				trace(data.isOK);
				trace(data.stat);
			});
			urlLoader.load(new URLRequest(api.apiCode()));
			*/
		}
		
	}
	
}