package net.wonderfl.data 
{
	/**
	 * User Data object, which used in code data.
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
		 * The url of the user icon.
		 * ユーザーのアイコンURL
		 */
		public function get icon(): String { return _data.icon; }
		
		/**
		 * The name of the user.
		 * ユーザーの名前
		 */
		public function get name(): String { return _data.name; }
		
	}

}