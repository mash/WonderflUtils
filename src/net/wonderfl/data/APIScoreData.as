package net.wonderfl.data 
{
	/**
	 * Score API で取得したデータオブジェクト
	 * http://api.wonderfl.net/score/[app_id]?api_key=[api_key]
	 * @author jc at bkzen
	 */
	public class APIScoreData extends WonderflAPIData
	{
		protected var _length: int;
		protected var _scores: Vector.<ScoreData>;
		
		public function APIScoreData(data: Object) 
		{
			super(data);
			if (isOK)
			{
				_scores = new Vector.<ScoreData>();
				var arr: Array = _data.scores;
				_length = arr.length;
				for (var i: int = 0; i < _length; i++) 
				{
					_scores[i] = new ScoreData(arr[i]);
				}
				_scores.fixed = true;
			}
		}
		
		/**
		 * ScoreData の個数
		 */
		public function get length(): int { return _length; }
		
		/**
		 * ScoreData の配列
		 */
		public function get scores(): Vector.<ScoreData> { return _scores; }
		
	}

}