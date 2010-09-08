package net.wonderfl.data 
{
	/**
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
		 * コード ID(Application ID)
		 */
		public function get id(): String { return _data.id; }
		
		/**
		 * もしこのコードが何かをforkした作品だった場合はそのID
		 */
		public function get parent(): String { return _data.parent; }
		
		/**
		 * このコードが何かをフォークした作品かどうか
		 */
		public function get isParent(): Boolean { return parent != null; }
		
		/**
		 * コードのタイトル
		 */
		public function get title(): String { return _data.title; }
		
		/**
		 * コンパイルのステータス(1：コンパイル完了, 0:コンパイル未完了)
		 */
		public function get compile_ok(): String { return _data.compile_ok; }
		
		/**
		 * コンパイルできているかどうか
		 */
		public function get compileOK(): Boolean { return compile_ok == "1"; }
		
		/**
		 * 作成された日付(1970年1月1日0時(世界時)からの秒数)
		 */
		public function get created_date(): int { return _data.created_date; }
		
		/**
		 * 作成された日付
		 */
		public function get createdDate(): Date { return _createdDate; }
		
		/**
		 * ライセンス
		 */
		public function get license(): String { return _data.license; }
		
		/**
		 * フォークした場合などにフォーク元との差の行数
		 */
		public function get diff(): int { return _data.diff; }
		
		/**
		 * サムネイルのURL
		 */
		public function get thumbnail(): String { return _data.thumbnail; }
		
		/**
		 * SWFファイル の URL
		 */
		public function get swf(): String { return _data.swf; }
		
	}

}