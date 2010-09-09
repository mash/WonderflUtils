package net.wonderfl.data 
{
	/**
	 * ユーザーデータオブジェクト
	 * @author jc at bkzen
	 */
	public class UserData extends SmallUserData
	{
		
		public function UserData(data:Object) 
		{
			super(data);
		}
		
		/**
		 * ユーザーのサイトURL
		 */
		public function get external_url(): String { return _data.external_url; }
		
		/**
		 * ユーザーの説明
		 */
		public function get description(): String { return _data.description; }
		
		
       /**
        * ユーザのコード数
        */
        public function get code_count(): int { return _data.code_count; }
	}

}