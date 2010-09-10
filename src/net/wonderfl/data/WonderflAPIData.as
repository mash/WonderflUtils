package net.wonderfl.data 
{
	/**
	 * The basic api response object.
	 * Wonderfl API のデータオブジェクト
	 * @author jc at bkzen
	 */
	public class WonderflAPIData
	{
		public static const STATE_OK: String = "ok";
		public static const STATE_FAIL: String = "fail";
		
		protected var _data: Object;
		
		public function WonderflAPIData(data: Object) 
		{
			this._data = data || {};
		}
		
		public function get stat(): String 
		{
			return _data.stat;
		}
		
		public function get isOK(): Boolean
		{
			return stat == STATE_OK;
		}
		
		public function get message(): String
		{
			return isOK ? "" : _data.message;
		}
		
	}

}