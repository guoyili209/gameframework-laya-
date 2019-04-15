package core.tool.log {
    public class CDashPage {
        public function CDashPage(dashBoard:CDashBoard) {
            this._dashBoard = dashBoard;
        }
        public function get pageName():String{
            return this._pageName;
        }
        private var _pageName:String;
        private var _dashBoard:CDashBoard;
    }
}
