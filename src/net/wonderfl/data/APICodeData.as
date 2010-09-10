package net.wonderfl.data 
{
    /**
     * The result object of code api.
     * Code API で取得したデータオブジェクト
     * http://api.wonderfl.net/code/[app_id]?api_key=[api_key]
     * @author jc at bkzen
     */
    public class APICodeData extends WonderflAPIData
    {
        protected var _code: CodeData;
        
        public function APICodeData(data:Object) 
        {
            super(data);
            if (isOK)
            {
                _code = new CodeData(_data.code);
            }
        }
        
        /**
         * コードデータ
         */
        public function get code(): CodeData { return _code; }
        
    }

}
