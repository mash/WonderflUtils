package net.wonderfl.data 
{
	/**
	 * Code の情報データに使用される最低限のユーザーデータオブジェクト
	 * @author jc at bkzen
	 */
	public class SmallUserData
	{
		protected var _data: Object;
		
		public function SmallUserData(data: Object) 
		{
			this._data = data;
		}
		
		/**
		 * ユーザーのアイコンURL
		 */
		public function get icon(): String { return _data.icon; }
		
		/**
		 * ユーザーの名前
		 */
		public function get name(): String { return _data.name; }
		
	}

}