package core.tool.log {
    public class CLog {
        public static const ERROR:int = 3;
        public static const WARNING:int = 2;
        public static const NORMAL:int = 1;
        public static const TRACE:int = 0;
        public var iLogLevel:int = 1;
        
        public function CLog() {
        
        }
        
        public function traceMsg(msg:String):void {
            if (iLogLevel <= CLog.TRACE) {
                _logout(msg);
            }
        }
        
        public function normalMsg(msg:String):void {
            if(iLogLevel<=CLog.NORMAL){
                _logout(msg);
            }
        }
        
        public function warningMsg(msg:String):void {
            if(iLogLevel<=CLog.WARNING){
                _logout(msg);
            }
        }
        
        public function errorMsg(msg:String):void {
            if(iLogLevel<=CLog.ERROR){
                _logout(msg);
            }
        }
        
        private function _logout(msg:String):void {
            var str:String = null;
            var arr:Array = [];
            var str1:String = null;
            var index:int = 0;
            if (str == null) {
                str = _getErrorStack();
                arr = str.split("\n");
                if (arr && arr.length) {
                    str1 = arr.length >= 4 ? arr[3] : "";
                    index = str1.lastIndexOf("\/");
                    if (index >= 0) {
                        str1 = str1.substr(index + 1);
                    }
                    if (str1.charAt(str1.length - 1) == ")") {
                        str1 = str1.substr(0, str1.length - 1);
                    }
                    str = str1.split(":")[1];
                }
            }
            var ymd:String = _pDate.getFullYear().toString() + "-" + _pDate.getMonth().toString() + "-" + _pDate.getDate().toString() + " ";
            var hms:String = _pDate.getHours().toString() + ":" + _pDate.getMinutes().toString() + ":" + _pDate.getSeconds().toString() + " ";
            console.log(ymd + hms + "[Line:" + str + "] " + msg);
        }
        
        private function _getErrorStack():String {
            return __JS__('new Error().stack');
        }
        
        private var _pDate:Date = new Date();
    }
}
