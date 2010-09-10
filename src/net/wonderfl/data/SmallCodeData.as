package net.wonderfl.data 
{
	/**
	 * The small code data object
	 * 最小限のコードデータオブジェクト
	 * @author jc at bkzen
	 */
	public class SmallCodeData
	{
		protected var _createdDate: Date;
		protected var _data: Object;
		
		public function SmallCodeData(data: Object) 
		{
			this._data = data;
			_createdDate = new Date(created_date * 1000);
		}
		
		/**
		 * The application id of the code
		 * コード ID(Application ID)
		 */
		public function get id(): String { return _data.id; }
		
		/**
		 * The orginal code from which this code is forked. Might be null.
		 * もしこのコードが何かをforkした作品だった場合はそのID
		 */
		public function get parent(): String { return _data.parent; }
		
		/**
		 * Is this code is a fork of the other code?
		 * このコードが何かをフォークした作品かどうか
		 */
		public function get isParent(): Boolean { return parent != null; }
		
		/**
		 * The title of the code
		 * コードのタイトル
		 */
		public function get title(): String { return _data.title; }
		
		/**
		 * Compilation status(1: compiled, 0: not compiled)
		 * コンパイルのステータス(1：コンパイル完了, 0:コンパイル未完了)
		 */
		public function get compile_ok(): String { return _data.compile_ok; }
		
		/**
		 * Is compiled?
		 * コンパイルできているかどうか
		 */
		public function get compileOK(): Boolean { return compile_ok == "1"; }
		
		/**
		 * The number of seconds since midnight January 1, 1970, universal time.
		 * 作成された日付(1970年1月1日0時(世界時)からの秒数)
		 */
		public function get created_date(): int { return _data.created_date; }
		
		/**
		 * The creation date.
		 * 作成された日付
		 */
		public function get createdDate(): Date { return _createdDate; }
		
		/**
		 * The license of the code.
		 * ライセンス
		 */
		public function get license(): String { return _data.license; }
		
		/**
		 * The diff from the original code from which this code is forked.
		 * フォークした場合などにフォーク元との差の行数
		 */
		public function get diff(): int { return _data.diff; }
		
		/**
		 * The url of the thumbnail
		 * サムネイルのURL
		 */
		public function get thumbnail(): String { return _data.thumbnail; }
		
		/**
		 * The url of the swf
		 * SWFファイル の URL
		 */
		public function get swf(): String { return _data.swf; }
		
	}

}