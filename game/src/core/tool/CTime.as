package core.tool {
    public class CTime {
        public static var startDate:Date = new Date();
        
        public static var startTimestamp:Number = startDate.getTime();
    
        public static const ONE_DAY_MILLISECOND:int = 86400000;
    
        public static var loginServerTimestamp:Number;
    
        public static var timeFromFlashStart:int;
    
        private static var _theDate:Date = new Date();
    
        private static var _theDataBuf:Date = new Date();
        public function CTime() {
        }
        
        public static function getCurrentTime():String{
        
        }
        
        public static function clientRunElapsedTime():Number{
            var time:Number = _theDate.getTime() - startTimestamp;
            return time;
        }
    }
}
