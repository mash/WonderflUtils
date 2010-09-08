package net.wonderfl.data 
{
	/**
	 * コード詳細情報のデータオブジェクト
	 * @author jc at bkzen
	 */
	public class CodeData extends ForkCodeData
	{
		protected var _modifiedDate: Date;
		
		public function CodeData(data:Object) 
		{
			super(data);
			_modifiedDate = new Date(modified_date * 1000);
		}
		
		/**
		 * コードのスクリプト
		 */
		public function get as3(): String { return _data.as3; }
		
		/**
		 * 変更をした日付
		 */
		public function get modifiedDate(): Date { return _modifiedDate; }
		
		/**
		 * 変更をした日付(1970年1月1日0時(世界時)からの秒数)
		 */
		public function get modified_date(): int { return _data.modified_date; }
		
		/**
		 * フォークされた回数
		 */
		public function get forked_count(): int { return _data.forked_count; }
		
		/**
		 * favされた回数
		 */
		public function get favorite_count(): int { return _data.favorite_count; }
		
	}

}