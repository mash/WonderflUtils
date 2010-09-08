package net.wonderfl.data 
{
	/**
	 * 1つのスコアデータオブジェクト
	 * @author jc at bkzen
	 */
	public class ScoreData
	{
		protected var _data: Object;
		
		public function ScoreData(data: Object) 
		{
			this._data = data;
		}
		
		/**
		 * スコア
		 */
		public function get score(): int { return _data.score; }
		
		/**
		 * ユーザー名
		 */
		public function get name(): String { return _data.name; }
	}

}