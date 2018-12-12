package core.tool {
    public class CTraceUtil {
        public function CTraceUtil() {
        }
    
        public static function toString(arr:Array) : String
        {
            var index:int = 0;
            var str:String = "";
            while(index < arr.length)
            {
                if(isSimpleData(arr[index]) == true)
                {
                    str = str + String(arr[index]);
                }
                else if(arr[index] is Array)
                {
                    str = str + arrayToString(arr[index]);
                }
                else if(arr[index] is Object)
                {
                    str = str + objectToString(arr[index]);
                }
                index++;
            }
            return str;
        }
    
        private static function arrayToString(param1:Array) : String
        {
            var _loc4_:int = 0;
            var _loc2_:Number = param1.length;
            var _loc3_:* = "Array(" + _loc2_ + ")[";
            while(_loc4_ < _loc2_)
            {
                if(isSimpleData(param1[_loc4_]) == true)
                {
                    _loc3_ = _loc3_ + String(param1[_loc4_]) + ",";
                }
                else if(param1[_loc4_] is Array)
                {
                    _loc3_ = _loc3_ + arrayToString(param1[_loc4_]) + ",";
                }
                else if(param1[_loc4_] is Object)
                {
                    _loc3_ = _loc3_ + objectToString(param1[_loc4_]) + ",";
                }
                _loc4_++;
            }
            if(_loc2_ == 0)
            {
                _loc3_ = "Array(空数组)";
            }
            else
            {
                _loc3_ = _loc3_.substr(0,_loc3_.length - 1) + "]";
            }
            return _loc3_;
        }
    
        public static function objectToString(param1:Object) : String
        {
            var _loc3_:* = undefined;
            var _loc2_:* = "Object{";
            for(_loc3_ in param1)
            {
                if(isSimpleData(param1[_loc3_]) == true)
                {
                    _loc2_ = _loc2_ + _loc3_ + ":" + String(param1[_loc3_]) + ",";
                }
                else if(param1[_loc3_] is Array)
                {
                    _loc2_ = _loc2_ + _loc3_ + ":" + arrayToString(param1[_loc3_]) + ",";
                }
                else if(param1[_loc3_] is Object)
                {
                    _loc2_ = _loc2_ + _loc3_ + ":" + objectToString(param1[_loc3_]) + ",";
                }
            }
            if(_loc2_ == "Object{")
            {
                _loc2_ = param1.toString();
            }
            else
            {
                _loc2_ = _loc2_.substr(0,_loc2_.length - 1) + "}";
            }
            return _loc2_;
        }
    
        public static function print(... rest) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < rest.length)
            {
                if(isSimpleData(rest[_loc2_]) != true)
                {
                    if(!(rest[_loc2_] is Array))
                    {
                        if(rest[_loc2_] is Object)
                        {
                        }
                    }
                }
                _loc2_++;
            }
        }
    
        private static function isSimpleData(param1:*) : Boolean
        {
            return param1 is Boolean || param1 is int || param1 is Number || param1 is String || param1 is uint;
        }
    }
}
