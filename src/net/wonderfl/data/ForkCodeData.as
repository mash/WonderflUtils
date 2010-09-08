package net.wonderfl.data 
{
	/**
	 * フォークされたコードのデータオブジェクト
	 * @author jc at bkzen
	 */
	public class ForkCodeData extends SmallCodeData
	{
		protected var _user: SmallUserData;
		
		public function ForkCodeData(data:Object) 
		{
			super(data);
			_user = new SmallUserData(data.user);
		}
		
		/**
		 * ユーザーデータ
		 */
		public function get user(): SmallUserData { return _user; }
		
	}

}