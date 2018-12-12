package core.tool {
    public class CLog {
        public function CLog() {
            var str:String = null;
            var arr:Array = [];
            var str1:String = null;
            var index:int=0;
            if(str == null )
            {
                str = getErrorStack();
                arr = str.split("\n");
                if(arr && arr.length)
                {
                    str1 = arr.length >= 4?arr[3]:"";
                    index = str1.lastIndexOf("\/");
                    if(index >= 0)
                    {
                        str1 = str1.substr(index + 1);
                    }
                    if(str1.charAt(str1.length - 1) == ")")
                    {
                        str1 = str1.substr(0,str1.length - 1);
                    }
                    str = str1.split(":")[1];
                }
            }
            var ymd:String = _pDate.getFullYear().toString() + "-" + _pDate.getMonth().toString() + "-" +  _pDate.getDate().toString() + " ";
            var hms:String = _pDate.getHours().toString() + ":" + _pDate.getMinutes().toString() + ":" + _pDate.getSeconds().toString() + " ";
            console.log(ymd + hms + "[Line:" + str + "] ");
        }
    
        private function getErrorStack():String{
            return __JS__('new Error().stack');
        }
        
        private var _pDate:Date = new Date();
    }
}
