package net.wonderfl.data 
{
    /**
     * Object for the forked code
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
         * User name.
         * ユーザーデータ
         */
        public function get user(): SmallUserData { return _user; }
        
    }

}