package net.wonderfl.data 
{
	/**
	 * User Codes API で取得したデータオブジェクト(最新の20件)
	 * http://api.wonderfl.net/user/[user_name]/codes?api_key=[api_key]
	 * @author jc at bkzen
	 */
	public class APIUserCodesData extends WonderflAPIData
	{
		protected var _length: int;
		protected var _codes: Vector.<SmallCodeData>;
		
		public function APIUserCodesData(data:Object) 
		{
			super(data);
			if (isOK)
			{
				_codes = new Vector.<SmallCodeData>();
				var arr: Array = _data.codes;
				_length = arr.length;
				for (var i: int = 0; i < _length; i++) 
				{
					_codes[i] = new SmallCodeData(arr[i]);
				}
				_codes.fixed = true;
			}
		}
		
		/**
		 * コードデータの個数
		 */
		public function get length(): int { return _length; }
		
		/**
		 * コードデータの配列
		 */
		public function get codes(): Vector.<SmallCodeData> { return _codes; }
		
	}

}