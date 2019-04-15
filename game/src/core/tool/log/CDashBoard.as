package core.tool.log {
    import laya.display.Sprite;
    
    public class CDashBoard {
        public function CDashBoard(container:Sprite) {
            _rootContainer = container;
            _init();
        }
        
        public function addPage(page:CDashPage):void {
            _pageCount++;
            this._pageVec.push(page);
        }
        
        public function get boardContainer():Sprite{
            return this._boardContainer;
        }
        
        private function _init():void{
            _boardContainer = new Sprite();
            _rootContainer.addChild(_boardContainer);
            
        }
        
        private var _pageVec:Vector.<CDashPage> = new Vector.<CDashPage>();
        private var _pageCount:int = 0;
        private var _rootContainer:Sprite = null;
        private var _boardContainer:Sprite = null;
    }
}
