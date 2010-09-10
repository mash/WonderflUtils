package net.wonderfl.utils 
{
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	/**
	 * Wonderfl API Library for AS3
	 * Wonderfl API を使うためのライブラリ
	 * @author jc at bkzen
	 */
	public class WonderflAPI
	{
		public static const CODE_URL: String       = "http://wonderfl.net/c/";
		public static const API_URL: String        = "http://api.wonderfl.net/";
		public static const API_CODE: String       = API_URL + "code/%ID%?api_key=%API_KEY%";
		public static const API_USER: String       = API_URL + "user/%NAME%?api_key=%API_KEY%";
		public static const API_FORKS: String      = API_URL + "code/%ID%/forks?api_key=%API_KEY%";
		public static const API_SCORE_GET: String  = API_URL + "score/%ID%?api_key=%API_KEY%&descend=%DESC%&limit=%LIMIT%";
		public static const API_SCORE_SET: String  = API_URL + "score/%ID%";
		public static const API_USER_CODES: String = API_URL + "user/%NAME%/codes?api_key=%API_KEY%";
		
		private var _apiCode: String;
		private var _apiUser: String;
		private var _apiForks: String;
		private var _apiScoreGet: String;
		private var _apiScoreSet: String;
		private var _apiUserCodes: String;
		
		private var _key: String;
		private var _appID: String;
		private var _domain: String;
		private var _apiKey: String;
		private var _viewerIconURL: String;
		private var _viewerDisplayName: String;
		
		/**
		 * Wonderfl API Library for AS3
		 * Wonderfl API を使用するためのライブラリ
		 * コンストラクタ
		 * @param	params : FlashVars (loaderInfo.parameters)
		 * @param	apiKey : Open API Key is set for the default.
		 */
		public function WonderflAPI(params: Object, apiKey: String = null) 
		{
			_key               = params["key"];
			_appID             = params["appId"];
			_domain            = params["domain"];
			_apiKey        = apiKey || params["open_api_key"];
			_viewerIconURL     = params["viewer.iconURL"];
			_viewerDisplayName = params["viewer.displayName"];
			
			//
			_apiCode      = API_CODE.replace(/%API_KEY%/, _apiKey);
			_apiUser      = API_USER.replace(/%API_KEY%/, _apiKey);
			_apiForks     = API_FORKS.replace(/%API_KEY%/, _apiKey);
			_apiScoreGet  = API_SCORE_GET.replace(/%API_KEY%/, _apiKey);
			_apiScoreSet  = API_SCORE_SET.replace(/%API_KEY%/, _apiKey);
			_apiUserCodes = API_USER_CODES.replace(/%API_KEY%/, _apiKey);
		}
		
		/**
		 * Get Application ID from URL 
		 * URL から Application ID を取得
		 * @param	url : the url of the code page (現在のコードのURL)
		 * @return	
		 */
		public function getAppID(url: String): String
		{
			return url.replace(CODE_URL, "");
		}
		
		/**
		 * Get the URLRequest for the code api.
		 * Code API の URL を取得
		 * @param	appID : The application ID. The default value is set appId of the param(Constructor argument, usually flashvars) given to the constructor.
		 *                 　Code API に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return The URLRequest for code api.
		 */
		public function apiCode(appID: String = null): URLRequest
		{
			return new URLRequest(_apiCode.replace(/%ID%/, appID || _appID));
		}
		
		/**
		 * Get the URLRequest for the user api.
		 * User API の URL を取得
		 * @param	user : The username to request the api. If not set, viewer.displayName of param(Constructor argument, usually flashvars) is set as the default value.
		 *                 User API に指定する UserName. 指定しなかった場合はコンストラクタで指定したオブジェクトの viewer.displayName が使用される。
		 * @return The URLRequest for user api.
		 */
		public function apiUser(user: String = null): URLRequest
		{
			return new URLRequest(_apiUser.replace(/%NAME%/, user || _viewerDisplayName));
		}
		
		/**
		 * Get the URLRequest for the forks api.
		 * Forks Code API の URL を取得
		 * @param	appID : The application id. If not set, appId of param(Constructor argument, usually flashvars) is set as the default value. 
		 *                  Forks Code API に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return The URLRequest for forks api.
		 */
		public function apiForks(appID: String = null): URLRequest
		{
			return new URLRequest(_apiForks.replace(/%ID%/, appID || _appID));
		}
		
		/**
		 * Get the URLRequest for the score api(GET).
		 * Score API (GET) の URL を取得
		 * @param	limit	: The limit of the numbers of the records to fetch.(1-99) スコアの取得数 (1 - 99)
		 * @param	descend	: 1: Descending 0: Ascending, 1:降順で取得、 0: 昇順で取得
		 * @param	appID	: The application ID. Score API (get) に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return
		 */
		public function apiScoreGet(limit: uint = 20, descend: uint = 1, appID: String = null): URLRequest
		{
			return new URLRequest(_apiScoreGet.replace(/%ID%/, appID || _appID).replace(
				/%DESC%/,  descend > 1 ? 1 : descend).replace(/%LIMIT%/, limit > 99 ? 99 : (limit || 1)));
		}
		
		/**
		 * Get the URLRequest for the score api(POST).
		 * @param	score	: スコア
		 * @param	name	: ユーザー名。指定しなかった場合はコンストラクタで指定した viewer.displayName が使用される。
		 * @param	appID	: The application id. Score API (set) に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return
		 */
		public function apiScorePostObject(score: int, name: String = null, appID: String = null): URLRequest
		{
			var request:URLRequest = new URLRequest;
			
			var param:URLVariables = new URLVariables;
			param.api_key = _apiKey;
			param.name = name || _viewerDisplayName;
			param.score = score;
			
			request.method = URLRequestMethod.POST;
			request.data = param;
			
			return request;
		}
		
		/**
		 * The URLRequest for the user codes api.
		 * User Codes API の URL を取得
		 * @param	name	: The user name. If not set, the default value is set as view.displayName of param(Constructor argument, usually flashvars) 
		 *                    ユーザー名。指定しなかった場合はコンストラクタで指定した viewer.displayName が使用される。
		 * @return
		 */
		public function apiUserCodes(name: String = null): URLRequest
		{
			return new URLRequest(_apiUserCodes.replace(/%NAME%/, name || _viewerDisplayName));
		}
		
		public function get key(): String { return _key; }
		
		public function get appID(): String { return _appID; }
		
		public function get domain(): String { return _domain; }
		
		public function get apiKey(): String { return _apiKey; }
		
		public function get viewerIconURL(): String { return _viewerIconURL; }
		
		public function get viewerDisplayName(): String { return _viewerDisplayName; }
		
	}

}