package net.wonderfl.data 
{
    /**
     * Object for code detail
     * コード詳細情報のデータオブジェクト
     * @author jc at bkzen
     */
    public class CodeData extends ForkCodeData
    {
        protected var _modifiedDate: Date;
        
        public function CodeData(data:Object) 
        {
            super(data);
            _modifiedDate = new Date(modified_date * 1000);
        }
        
        /**
         * The script(AS3) for the code
         * コードのスクリプト
         */
        public function get as3(): String { return _data.as3; }
        
        /**
         * The modified date
         * 変更をした日付
         */
        public function get modifiedDate(): Date { return _modifiedDate; }
        
        /**
         * The modified date (seconds since midnight January 1, 1970, universal time)
         * 変更をした日付(1970年1月1日0時(世界時)からの秒数)
         */
        public function get modified_date(): int { return _data.modified_date; }
        
        /**
         * The number of forks.
         * フォークされた回数
         */
        public function get forked_count(): int { return _data.forked_count; }
        
        /**
         * The number of favorites
         * favされた回数
         */
        public function get favorite_count(): int { return _data.favorite_count; }
        
    }

}