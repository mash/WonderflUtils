package net.wonderfl.utils 
{
	/**
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
		private var _openAPIKey: String;
		private var _viewerIconURL: String;
		private var _viewerDisplayName: String;
		
		/**
		 * Wonderfl API を使用するためのライブラリ
		 * コンストラクタ
		 * @param	params : FlashVars を指定 (loaderInfo.parameters)
		 * @param	apiKey : Open API Key を使用しない場合に使用する。
		 */
		public function WonderflAPI(params: Object, apiKey: String = null) 
		{
			_key               = params["key"];
			_appID             = params["appId"];
			_domain            = params["domain"];
			_openAPIKey        = apiKey || params["open_api_key"];
			_viewerIconURL     = params["viewer.iconURL"];
			_viewerDisplayName = params["viewer.displayName"];
			
			//
			_apiCode      = API_CODE.replace(/%API_KEY%/, _openAPIKey);
			_apiUser      = API_USER.replace(/%API_KEY%/, _openAPIKey);
			_apiForks     = API_FORKS.replace(/%API_KEY%/, _openAPIKey);
			_apiScoreGet  = API_SCORE_GET.replace(/%API_KEY%/, _openAPIKey);
			_apiScoreSet  = API_SCORE_SET.replace(/%API_KEY%/, _openAPIKey);
			_apiUserCodes = API_USER_CODES.replace(/%API_KEY%/, _openAPIKey);
			
		}
		
		/**
		 * URL から Application ID を取得
		 * @param	url : 現在のコードのURL
		 * @return	
		 */
		public function getAppID(url: String): String
		{
			return url.replace(CODE_URL, "");
		}
		
		/**
		 * Code API の URL を取得
		 * @param	appID :　Code API に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return
		 */
		public function apiCode(appID: String = null): String
		{
			return _apiCode.replace(/%ID%/, appID || _appID);
		}
		
		/**
		 * User API の URL を取得
		 * @param	user : User API に指定する UserName. 指定しなかった場合はコンストラクタで指定したオブジェクトの viewer.displayName が使用される。
		 * @return
		 */
		public function apiUser(user: String = null): String
		{
			return _apiUser.replace(/%NAME%/, user || _viewerDisplayName);
		}
		
		/**
		 * Forks Code API の URL を取得
		 * @param	appID : Forks Code API に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return
		 */
		public function apiForks(appID: String = null): String
		{
			return _apiForks.replace(/%ID%/, appID || _appID);
		}
		
		/**
		 * Score API (get) の URL を取得
		 * @param	limit	: スコアの取得数 (1 - 99)
		 * @param	descend	: 1:降順で取得、 0: 昇順で取得
		 * @param	appID	: Score API (get) に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return
		 */
		public function apiScoreGet(limit: uint = 20, descend: uint = 1, appID: String = null): String
		{
			return _apiScoreGet.replace(/%ID%/, appID || _appID).replace(
				/%DESC%/,  descend > 1 ? 1 : descend).replace(/%LIMIT%/, limit > 99 ? 99 : (limit || 1));
		}
		
		/**
		 * Score API (set) の URL を取得
		 * @param	appID	: Score API (set) に指定する Application ID. 指定しなかった場合はコンストラクタで指定したオブジェクトの appId が使用される。
		 * @return
		 */
		public function apiScoreSet(appID: String = null): String
		{
			return _apiScoreSet.replace(/%ID%/, appID || _appID);
		}
		
		/**
		 * Score API (set) の Post データを取得
		 * @param	score	: スコア
		 * @param	name	: ユーザー名。指定しなかった場合はコンストラクタで指定した viewer.displayName が使用される。
		 * @return
		 */
		public function apiScorePostObject(score: int, name: String = null): Object
		{
			return { "api_key": _openAPIKey, "name": name, "score": (score || _viewerDisplayName) };
		}
		
		
		
		public function get key(): String { return _key; }
		
		public function get appID(): String { return _appID; }
		
		public function get domain(): String { return _domain; }
		
		public function get openAPIKey(): String { return _openAPIKey; }
		
		public function get viewerIconURL(): String { return _viewerIconURL; }
		
		public function get viewerDisplayName(): String { return _viewerDisplayName; }
		
	}

}