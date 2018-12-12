package core.tool {
    public class CHtmlUtil {
        public function CHtmlUtil() {
        }
    
        public static function color(str:String, color:String) : String
        {
            return "<font color=\'" + color + "\'>" + str + "</font>";
        }
    
        public static function img(url:String, hspace:int = 0, vspace:int = 0, align:String = "right", w:int = 65, h:int = 65) : String
        {
            return "<img src = \'" + url + "\'" + " hspace = \'" + hspace + "\' vspace = \'" + vspace + "\' align = \'" + align + "\' width = \'" + w + "\' height = \'" + h + "\'>";
        }
    
        public static function sizeColor(str:String, color:String = null, size:int = 0) : String
        {
            var result:* = "<font ";
            if(size != 0)
            {
                result = result + "size=\'" + size + "\' ";
            }
            if(color != null)
            {
                result = result + "color=\'" + color + "\' ";
            }
            result = result + ">" + str + "</font>";
            return result;
        }
    
        public static function bold(str:String) : String
        {
            return "<b>" + str + "</b>";
        }
    
        public static function u(str:String) : String
        {
            return "<u>" + str + "</u>";
        }
    
        public static function leading(leading:int, str:String) : String
        {
            return "<textformat leading=\'" + String(leading) + "\'>" + str + "</textformat>";
        }
    
        public static function letterspacing(space:int, str:String) : String
        {
            return "<font LETTERSPACING=\'" + String(space) + "\'>" + str + "</font>";
        }
    
        public static function br(str:String) : String
        {
            return str + "\n";
        }
    
        public static function removeHtml(str:String) : String
        {
            var result:String = str.replace(/\<\/?[^\<\>]+\>""\<\/?[^\<\>]+\>/gmi,"");
            result = result.replace(/[\r\n ]+""[\r\n ]+/g,"");
            return result;
        }
    
        public static function href(str:String, url:String, color:String = "#FF0000") : String
        {
            return "<font color=\'" + color + "\'><a href=\"event:" + url + "\">" + str + "</a></font>";
        }
      
        public static function hrefNoColor(str:String, url:String) : String
        {
            return "<a href=\"event:" + url + "\">" + str + "</a>";
        }
    
        public static function hrefAndU(str:String, url:String, color:String = "#FF0000") : String
        {
            return "<u>" + href(str,url,color) + "</u>";
        }
    
        public static function MakeLeading(str:String, leadingSize:int = 5) : String
        {
            return "<textformat leading=\'" + leadingSize + "\'>" + str + "</textformat>";
        }
    
        public static function pStr(str:String, align:String = "left") : String
        {
            return "<p align=\'" + align + "\'>" + str + "</p>";
        }
    }
}
