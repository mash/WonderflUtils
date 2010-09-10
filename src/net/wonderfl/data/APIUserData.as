package net.wonderfl.data 
{
    /**
     * The result object of user data api
     * ユーザーデータ API で取得したデータオブジェクト
     * http://api.wonderfl.net/user/[user_name]?api_key=[api_key]
     * @author jc at bkzen
     */
    public class APIUserData extends WonderflAPIData
    {
        protected var _user: UserData;
        
        public function APIUserData(data:Object) 
        {
            super(data);
            if (isOK)
            {
                _user = new UserData(_data.user);
            }
        }
        
        /**
         * The user data
         * ユーザーデータ API で取得したデータ(isOK == true の時のみ)
         */
        public function get user(): UserData { return _user; }
        
    }

}
