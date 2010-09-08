package net.wonderfl.data 
{
	/**
	 * Forks Code API で取得したデータオブジェクト(最新50件)
	 * http://api.wonderfl.net/code/[app_id]/forks?api_key=[api_key]
	 * @author jc at bkzen
	 */
	public class APIForksData extends WonderflAPIData
	{
		protected var _length: int;
		protected var _forks: Vector.<ForkCodeData>;
		
		public function APIForksData(data:Object) 
		{
			super(data);
			if (isOK)
			{
				_forks = new Vector.<ScoreData>();
				var arr: Array = _data.forks;
				_length = arr.length;
				for (var i: int = 0; i < _length; i++) 
				{
					_forks[i] = new ForkCodeData(arr[i]);
				}
				_forks.fixed = true;
			}
		}
		
		/**
		 * フォークされたコードデータの数
		 */
		public function get length(): int { return _length; }
		
		/**
		 * フォークされたコードデータの配列
		 */
		public function get forks(): Vector.<ForkCodeData> { return _forks; }
		
		
	}

}