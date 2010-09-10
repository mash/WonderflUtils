package net.wonderfl.data 
{
    /**
     * User Data
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
         * The url written in user profile.
         * ユーザーのサイトURL
         */
        public function get external_url(): String { return _data.external_url; }
        
        /**
         * The user description from user profile.
         * ユーザーの説明
         */
        public function get description(): String { return _data.description; }
        
        
       /**
        * The nubmer of codes the user posted.
        * ユーザのコード数
        */
        public function get code_count(): int { return _data.code_count; }
    }

}